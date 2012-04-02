WarehouseTwo::Application.configure do
  # NOTE: Much of this can probably be removed as we're not really using Rails, more AR.
  config.cache_classes = false
  config.whiny_nils = true
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log
  config.action_dispatch.best_standards_support = :builtin
  config.assets.compress = false
  config.assets.debug = true

  # Here is some ActiveRecord configuration that is useful
  config.active_record.mass_assignment_sanitizer         = :strict
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Configure the numeric tolerance
  config.numeric_tolerance = 0.05

  # Configure the AMQP consumer
  config.amqp.url                = 'amqp://localhost:5672/'
  config.amqp.queue              = 'queue'
  config.amqp.prefetch           = 100
  config.amqp.requeue            = false
  config.amqp.reconnect_interval = 10
end
