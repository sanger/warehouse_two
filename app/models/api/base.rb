class Api::Base < ActiveResource::Base
  self.site = "#{configatron.api_url}/#{configatron.api_version}"
  self.format = :json
  self.timeout = 600
  if configatron.proxy
    self.proxy = configatron.proxy
  end

  def self.each_page(start_page = 1, &block)
    page, results = start_page, [ :dummy ]
    until results.empty?
      results = self.find(:all, :params => {:page => page})
      yield(results) unless results.blank?
      page = page + 1
    end
  end
  
  def self.parse_index_with_full_objects(current_page = 1, number_of_pages = nil)
    starting_page = current_page
    each_page do |results_from_page|
      current_time = Time.now.utc
      uuid_data = []
      results_from_page.each do |remote_resource|
        internal_id = "<unknown>" # to display in log if an exception is raised
        begin
          local_resource_object = eval(self.model_name).create_or_update_object(remote_resource)
          uuid = local_resource_object.uuid
          object_name = self.collection_name
          if local_resource_object.respond_to?(:name)
            name = local_resource_object.name
          end
          if local_resource_object.respond_to?(:internal_id)
            internal_id = local_resource_object.internal_id
          end

          if uuid_object = ::UuidObject.find_by_uuid(uuid)
            uuid_object.update_attributes( :name => name, :last_updated => local_resource_object.try(:last_updated), :checked_at => current_time)
            uuid_object.save!
          else
            uuid_data << UuidObject.new(:uuid => uuid, 
                                        :object_name => object_name, 
                                        :internal_id => internal_id, 
                                        :name => name, 
                                        :created => local_resource_object.try(:created), 
                                        :last_updated => local_resource_object.try(:last_updated), 
                                        :checked_at => current_time)
          end
        rescue Exception => ex
          Rails.logger.error "Failed - #{self.model_name} #{internal_id} - #{ex}" 
          Rails.logger.debug { "Failed - #{self.model_name} #{remote_resource.to_yaml}" } # {} are important to evaluate to_yaml if not needed
        end
      end
      unless uuid_data.empty?
        UuidObject.import uuid_data
      end

      if number_of_pages && current_page >= (number_of_pages + starting_page)
        return
      end
      current_page += 1
    end
  end
  
  def self.create_or_update_object(remote_resource)
    lc_class_name = self.collection_name.singularize.camelize
    eval("::#{lc_class_name}").create_or_update(remote_resource)
  end
  
  def self.parse_index
    each_page do |results_from_page|
      uuid_objects_to_create = []
      uncreated_uuids = filter_uncreated_uuids(results_from_page.map{ |remote_resource| remote_resource.uuid})
      results_from_page.each do |remote_resource|
        next unless uncreated_uuids.include?(remote_resource.uuid)
        uuid_objects_to_create << UuidObject.new(:uuid => remote_resource.uuid, :object_name => self.collection_name, :url => remote_resource.url)
      end
      UuidObject.import uuid_objects_to_create
    end
  end
  
  def self.filter_uncreated_uuids(uuids)
    existing_uuids = UuidObject.find(:all, :conditions => ["uuid in(?)", uuids])
    uuids - existing_uuids
  end
  
end
