require 'raspell'

module Aspellbee
  module Middleware
    class InjectClient < Base
      def call(env)
        env['aspell'] = ::Aspell.new('en_US')

        env['aspell'].suggestion_mode = ::Aspell::NORMAL

        env['aspell'].set_option('mode', 'html')

        @app.call(env)
      end
    end
  end
end
