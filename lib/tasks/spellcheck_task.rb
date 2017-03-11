require 'rake'
require 'rake/tasklib'
require 'raspell'
require 'aspellbee'

module Aspellbee
  class RakeTask < Rake::TaskLib

    def initialize
      namespace :aspellbee do
        desc 'Run aspell on current directory'
        task :spelling do
          raspell = ::Aspell.new('en_US')
          raspell.suggestion_mode = ::Aspell::NORMAL
          raspell.set_option('mode', 'html')

          all_files = Dir["./**/*.md"]

          full_results = []

          runner = Aspellbee::Runner.new
          all_files.each do | file |
            full_results << runner.run_on_file(file, raspell)
          end

          puts full_results
        end
      end
    end
  end
end
