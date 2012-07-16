class WarehouseModelGenerator < Rails::Generator::NamedBase
  class Generator
    def initialize(value)
      @value = value
    end

    def next
      @value.tap { @value = @value + 1 }
    end
  end

  class Uuid
    def initialize(initial_value = 1)
      @start = initial_value
    end

    def +(value)
      Uuid.new((@start+value) % 10)
    end

    def to_s
      values = (0..4).map { |v| (@start+v) % 10 }.map(&:to_s)
      counts = [ 8, 4, 4, 4, 12 ]
      values.zip(counts).map { |k,v| "#{k*v}" }.join('-')
    end
  end

  def banner
    "Usage: #{$0} #{spec.name} ModelName"
  end

  def uuid_generator
    @uuid_generator ||= Generator.new(Uuid.new)
  end

  def integer_generator
    @integer_generator ||= Generator.new(1)
  end

  IGNORE_FIELDS = [ :dont_use_id, :inserted_at, :deleted_at, :checked_at, :is_current ]

  def columns
    model.columns.map do |column|
      next if IGNORE_FIELDS.include?(column.name.to_sym)

      name = 
        case column.name.to_sym
        when :last_updated then :updated_at
        when :created then :created_at
        else column.name
        end

      value =
        case column.type.to_sym
        when :binary   then uuid_generator.next.to_s
        when :integer  then integer_generator.next
        when :boolean  then true
        when :datetime then Time.now.utc.strftime('%Y-%m-%d %H:%M:%S')
        else                column.name.to_s.gsub(/_/, ' ')
        end
      if column.type.to_sym == :string && column.limit < value.length
        value = value.split(/\s+/).map(&:first).join.slice(0, column.limit)
      end
      [ name, value ]
    end.compact
  end

  def model
    return @model if @model.present?
    @model = Class.new(ActiveRecord::Base)
    @model.set_table_name(plural_name)
    @model
  end

  def manifest
    record do |manifest|
      manifest.directory('app/models')
      manifest.directory('spec/models')
      manifest.template('model.rb', "app/models/#{singular_name}.rb")
      manifest.template('spec.rb', "spec/models/#{singular_name}_spec.rb")
    end
  end
end
