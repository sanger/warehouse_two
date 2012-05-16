module Logging
  [ :debug, :info, :warn, :error ].each do |level|
    line = __LINE__ + 1
    class_eval(%Q{
      def #{level}(&message)
        Rails.logger.#{level} { "\#{self.class.name}: \#{message.call}" }
      end
    }, __FILE__, line)
  end
end
