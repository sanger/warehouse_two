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

  # Configure the main AMQP consumer
  config.amqp.main.url                    = 'amqp://localhost:5672/'
  config.amqp.main.queue                  = 'queue'
  config.amqp.main.prefetch               = 50
  config.amqp.main.requeue                = true
  config.amqp.main.reconnect_interval     = 10
  config.amqp.main.deadletter.exchange    = 'deadletters'
  config.amqp.main.deadletter.routing_key = 'test.deadletter'

  # Configure the deadletter AMQP consumer
  config.amqp.deadletter.url                             = 'amqp://localhost:5672/'
  config.amqp.deadletter.queue                           = 'deadletters'
  config.amqp.deadletter.prefetch                        = 50
  config.amqp.deadletter.requeue                         = true
  config.amqp.deadletter.reconnect_interval              = 10
  config.amqp.deadletter.empty_queue_disconnect_interval = 30

  # Configure the API interface
  config.api.root = 'http://localhost:3000/0_5/'
end
