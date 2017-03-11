module Aspellbee
  module Middleware
    # Check if the client has set-up configuration yet.
    class InjectConfiguration < Base
      def call(env)
        config = Aspellbee::Configuration.instance

        env['config'] = config

        @app.call(env)
      end
    end
  end
end
