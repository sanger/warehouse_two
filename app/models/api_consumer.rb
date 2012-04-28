class ApiConsumer
  class ResourceNotFound < StandardError
    def initialize(model, uuid)
      super("Cannot find #{model.name} with UUID #{uuid.inspect}")
      @model, @uuid = model, uuid
    end

    attr_reader :model, :uuid
  end

  class InfiniteSequence
    def initialize(start = 1)
      @start = start
    end

    def each(&block)
      index = @start
      while true
        yield(index)
        index += 1
      end
    end
  end

  module Wrapper
    def self.included(base)
      base.class_eval do
        attr_reader :consumer
        private :consumer

        delegate :client, :create, :model, :to => :consumer
        private :client, :create, :model
      end
    end

    def initialize(consumer)
      @consumer = consumer
    end
  end

  # Friendly wrapper around the client for retrieving pages.  Do not use directly, instead use
  # ApiConsumer#each or ApiConsumer#each_page
  class Paging
    include Logging
    include Wrapper
    include Enumerable

    def initialize(consumer)
      super(consumer)
    end

    def each(range = InfiniteSequence.new, &block)
      catch(:end_of_results) do
        range.each do |page|
          body = get(page)
          yield(ActiveSupport::JSON.decode(body).map(&method(:create)), page)
          debug { "Handled body #{body.inspect}" }
        end
      end
    end

    def get(page)
      client.get(:params => { :page => page }, :accept => :json) do |response, request, result, &block|
        # NOTE: The API returns 200 (OK) and an empty body if we're at the end of the results :(
        throw :end_of_results if response.code == 200 && response.body == '[]'
        response.return!(request, result, &block)
      end
    end
    private :get
  end

  # Friendly wrapper around the client for retrieving records by UUID.  Do not use directly, instead use
  # ApiConsumer#for_uuid.
  class Singular
    include Logging
    include Wrapper
    include Enumerable

    def initialize(consumer, uuids)
      super(consumer)
      @uuids = Array(uuids)
    end

    def each(&block)
      @uuids.each do |uuid|
        body = get(uuid)
        yield(create(ActiveSupport::JSON.decode(body)))
        debug { "Handled body #{body.inspect}" }
      end
    end

    def get(uuid)
      client[uuid].get(:accept => :json) do |response, request, result, &block|
        raise ResourceNotFound.new(model, uuid) if response.code == 404
        response.return!(request, result, &block)
      end
    end
    private :get
  end

  def initialize(model)
    @model                        = model
    @payload_name, @resource_name = [ :singularize, :pluralize ].map { |s| @model.name.underscore.send(s) }
    @client                       = RestClient::Resource.new(WarehouseTwo::Application.config.api.root)
  end

  attr_reader :model
  private :model

  def for_uuid(*uuid)
    Singular.new(self, uuid.flatten)
  end

  def each(&block)
    each_page { |records, _| records.each(&block) }
  end

  def each_page(range = InfiniteSeries.new, &block)
    Paging.new(self).each(range, &block)
  end

  def client
    @client[@resource_name]
  end
  private :client

  def create(json)
    @model.create_or_update_from_json(json[@payload_name])
  end
  private :create
end
