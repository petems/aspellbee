require 'thor'

module Aspellbee
  module Middleware
    # Check if the client can connect to the ocean
    class VerifyConfiguration < Base
      def call(env)
        # We use a harmless API call to check if the authentication will
        # work.
        verify_configuration(true)

        @app.call(env)
      end
    end
  end
end
