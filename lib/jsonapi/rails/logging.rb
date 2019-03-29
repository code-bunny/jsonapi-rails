module JSONAPI
  module Rails
    # @private
    module Logging
      def logger
        @logger ||= config[:logger]
      end

      def logger=(logger)
        @logger = logger
      end
    end
  end
end
