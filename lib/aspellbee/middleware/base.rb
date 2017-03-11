module Aspellbee
  module Middleware
    # A base middleware class to initalize.
    class Base
      # Some colors for making things pretty.
      CLEAR      = "\e[0m".freeze
      RED        = "\e[31m".freeze
      GREEN      = "\e[32m".freeze
      YELLOW     = "\e[33m".freeze

      # We want access to all of the fun thor cli helper methods,
      # like say, yes?, ask, etc.
      include Thor::Shell

      def initialize(app)
        @app = app
        # This resets the color to "clear" on the user's terminal.
        say '', :clear, false
      end

      def call(env)
        @app.call(env)
      end

      def check_file(file)
        say "Checking #{file}"

        lines = File.read(file).split("\n")

        success = true
        lines.each_with_index do |text, index|
          misspelled = misspelled_on_line(text)
          next if misspelled.empty?

          success = false
          print_misspelled(misspelled, index, text)
        end

        success
      end

      def verify_configuration(say_success = false)
        say 'Configuration is good.', :green if say_success
      end
    end
  end
end
