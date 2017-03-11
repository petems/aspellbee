module Aspellbee
  module Middleware
    # Ask for user credentials from the command line, then write them out.
    class AskForConfiguration < Base
      def call(env)
        aspell_locale = ask 'Enter aspell locale (defaults to en_US):'
        aspell_suggestion_mode = ask 'Enter aspell suggestion mode (defaults to normal):'
        aspell_mode = ask 'Enter aspell mode (defaults to html):'

        # Write the config file.
        env['config'].create_config_file(aspell_locale, aspell_suggestion_mode, aspell_mode)
        env['config'].reload!

        @app.call(env)
      end
    end
  end
end
