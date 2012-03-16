require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module WarehouseTwo
  class Application < Rails::Application
    config.autoload_paths    += [ "#{config.root}/lib" ]
    config.time_zone          = 'UTC'
    config.encoding           = "utf-8"
    config.filter_parameters += [:password]
    config.assets.enabled     = false
    config.assets.version     = '1.0'

    # We're going to need a specialised configuration for our AMQP consumer
    config.amqp = ActiveSupport::Configurable::Configuration.new
  end
end
