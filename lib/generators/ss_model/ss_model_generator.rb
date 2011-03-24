class SsModelGenerator < Rails::Generator::NamedBase
  def banner
    "Usage: #{$0} #{spec.name} ModelName"
  end

  def model
    singular_name.classify.constantize
  end

  def manifest
    record do |manifest|
      manifest.directory("app/models/api")
      manifest.directory("features")
      manifest.directory("lib")
      
      manifest.migration_template("migration.rb", "db/migrate", :migration_file_name => "add_#{singular_name}_ss_model")
      manifest.template('model.rb',      "app/models/#{singular_name}.rb")
      manifest.template('active_resource_model.rb',      "app/models/api/#{singular_name}.rb")
      manifest.template('cucumber.feature',            "features/plain/#{plural_name}.feature")
      manifest.template('loader.rb', "lib/#{singular_name}_loader.rb")

      manifest.readme('WHAT-TO-DO-NEXT')
    end
  end
end
