require 'middleware'

module Aspellbee
  module Middleware
    autoload :AskForConfiguration, 'aspellbee/middleware/ask_for_configuration'
    autoload :Base, 'aspellbee/middleware/base'
    autoload :CheckConfiguration, 'aspellbee/middleware/check_configuration'
    autoload :Config, 'aspellbee/middleware/config'
    autoload :InjectClient, 'aspellbee/middleware/inject_client'
    autoload :InjectConfiguration, 'aspellbee/middleware/inject_configuration'
    autoload :RunOnFile, 'aspellbee/middleware/run_on_file'
    autoload :VerifyConfiguration, 'aspellbee/middleware/verify_configuration'

    # Start the authorization flow.
    # This writes a ~/.aspellbee file, which can be edited manually.
    def self.sequence_authorize
      ::Middleware::Builder.new do
        use InjectConfiguration
        use AskForConfiguration
        use InjectConfiguration
        use CheckConfiguration
        use InjectClient
        use VerifyConfiguration
      end
    end

    # This checks that the credentials in ~/.aspellbee are valid
    def self.sequence_verify
      ::Middleware::Builder.new do
        use InjectConfiguration
        use CheckConfiguration
        use InjectClient
        use VerifyConfiguration
      end
    end

    def self.sequence_file
      ::Middleware::Builder.new do
        use InjectConfiguration
        use CheckConfiguration
        use InjectClient
        use RunOnFile
      end
    end

    # Returns current used config
    def self.sequence_config
      ::Middleware::Builder.new do
        use Config
      end
    end
  end
end
