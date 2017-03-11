module Aspellbee
  module Middleware
    # Check if the droplet in the environment is inactive, or "off"
    class Config < Base
      def call(env)
        config = Aspellbee::Configuration.instance

        keys_retracted = ''

        config_data = config.data.to_yaml.delete('"')

        if env['user_hide_keys']
          keys_retracted = '(Keys Redacted)'
          config_data = config_data.gsub(%r{(access_token: )([a-zA-Z0-9]+)}, '\1 [REDACTED]')
        end

        say "Current Config #{keys_retracted}\n", :green

        say "Path: #{config.path}"
        say config_data

        @app.call(env)
      end
    end
  end
end
