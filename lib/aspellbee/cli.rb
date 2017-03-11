require 'thor'

module Aspellbee
  autoload :Middleware, 'aspellbee/middleware'

  class CLI < Thor
    include Thor::Actions
    ENV['THOR_COLUMNS'] = '120'

    !check_unknown_options

    class_option :quiet, type: :boolean, aliases: '-q'

    map '--version'      => :version,
        '-v'             => :version,
        'password-reset' => :password_reset

    desc 'help [COMMAND]', 'Describe commands or a specific command'
    def help(meth = nil)
      super
      say 'To learn more or to contribute, please see github.com/petems/aspellbee' unless meth
    end

    desc 'configure', 'Configure aspellbee'
    long_desc "This takes you through a workflow for adding configuration
    details to aspellbee. You will be asked for default settings,
    which are stored in ~/.aspellbee.
    "
    def configure
      Middleware.sequence_authorize.call('aspellbee_action' => __method__,
                                         'user_quiet' => options[:quiet])
    end

    desc 'config', 'Show your current config information'
    long_desc "This shows the current information in the .aspellbee config
    being used by the app
    "
    def config
      Middleware.sequence_config.call('aspellbee_action' => __method__,)
    end

    desc 'file FILE_PATH', 'Run aspell against a particular file'
    long_desc "This will run aspell on a given file"
    def file(name)
      Middleware.sequence_file.call( 'aspellbee_action' => __method__,
                                     'aspellbee_file_to_check' => name)
    end

    desc 'version', 'Show version'
    def version
      say "aspellbee #{Aspellbee::VERSION}"
    end
  end
end
