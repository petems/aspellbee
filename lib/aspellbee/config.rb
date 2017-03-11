require 'singleton'

module Aspellbee
  # This is the configuration object. It reads in configuration
  # from a .aspellbee file located in the user's home directory

  class Configuration
    include Singleton
    attr_reader :data
    attr_reader :path

    FILE_NAME = '.aspellbee'.freeze
    ASPELL_LOCALE = 'en_US'.freeze
    ASPELL_SUGGESTION_MODE = 'normal'.freeze
    ASPELL_MODE = 'html'.freeze

    # Load config file from current directory, if not exit load from user's home directory
    def initialize
      @path = File.join(File.expand_path('.'), FILE_NAME)
      unless File.exist?(@path)
        @path = (ENV['ASPELLBEE_CONFIG_PATH'] || File.join(File.expand_path('~'), FILE_NAME))
      end
      @data = load_config_file
    end

    # If we can't load the config file, self.data is nil, which we can
    # check for in CheckConfiguration
    def load_config_file
      require 'yaml'
      YAML.load_file(@path)
    rescue Errno::ENOENT
      return
    end

    def aspell_locale
      @data['aspell_config']['locale']
    end

    def aspell_suggestion_mode
      @data['aspell_config']['suggestion_mode']
    end

    def aspell_mode
      @data['aspell_config']['mode']
    end

    # Re-runs initialize
    def reset!
      send(:initialize)
    end

    # Re-loads the config
    def reload!
      @data = load_config_file
    end

    # Writes a config file
    def create_config_file(aspell_locale, aspell_suggestion_mode, aspell_mode)
      aspell_locale = ASPELL_LOCALE if aspell_locale.empty?

      aspell_suggestion_mode = ASPELL_SUGGESTION_MODE if aspell_suggestion_mode.empty?

      aspell_mode = ASPELL_MODE if aspell_mode.empty?

      require 'yaml'
      File.open(@path, File::RDWR | File::TRUNC | File::CREAT, 0o600) do |file|
        data = {
          'aspell_config' => {
            'locale'          => aspell_locale,
            'suggestion_mode' => aspell_suggestion_mode,
            'mode'            => aspell_mode
          }
        }
        file.write data.to_yaml
      end
    end
  end
end
