module Aspellbee
  module Middleware
    # Check if the client has set-up configuration yet.
    class RunOnFile < Base
      def call(env)
        aspell = env['aspell']

        runner = Aspellbee::Runner.new

        results = runner.run_on_file(env['aspellbee_file_to_check'])

        results.each do | result |
          say result
        end

        @app.call(env)
      end
    end
  end
end
