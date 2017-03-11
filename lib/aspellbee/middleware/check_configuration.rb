module Aspellbee
  module Middleware
    # Check if the client has set-up configuration yet.
    class CheckConfiguration < Base
      def call(env)
        config = env['config']

        if !config || !config.data
          say 'You must run `aspellbee configure` in order to use aspellbee', :red
          exit 1
        end

        # If the user passes the global `-q/--quiet` flag, redirect
        # stdout
        $stdout = File.new('/dev/null', 'w') if env['user_quiet']

        @app.call(env)
      end
    end
  end
end
