require 'rake'
require 'rake/tasklib'
require 'worte'
require 'aspellbee'

module Aspellbee
  class RakeTask < Rake::TaskLib

    def initialize
      namespace :aspellbee do
        desc 'Run aspell on current directory'
        task :spelling do

          all_files = Dir["./**/*.md"]

          runner = Aspellbee::Runner.new
          all_files.each do | file |
            runner.run_on_file(file)
          end

          # puts full_results
        end
      end
    end
  end
end
