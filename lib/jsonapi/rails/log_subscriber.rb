module JSONAPI
  module Rails
    # @private
    class LogSubscriber < ActiveSupport::LogSubscriber
      def render(event)
        info do
          "Completed JSON API rendering (#{event.duration.round(2)}ms)"
        end
      end

      def parse(event)
        info do
          "Completed JSON API deserializing of #{event.payload[:key]}" \
          " (#{event.duration.round(2)})"
        end
      end

      def logger
        @logger ||= JSONAPI::Rails.logger
      end

      def logger=(logger)
        @logger = logger
      end
    end
  end
end

JSONAPI::Rails::LogSubscriber.attach_to :'jsonapi-rails'
