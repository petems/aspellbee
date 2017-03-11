module Aspellbee
  class Runner
    def run_on_file(file, aspell)
      results = []

      lines = File.read(file).split("\n")

      lines.each do | file_line |

        next if file_line.split('').empty?

        spelling_error = aspell.list_misspelled([file_line]).inspect

        next if spelling_error.eql?('[]')

        unless spelling_error.empty?
          results << "Spelling error detected: #{spelling_error} - Suggested fix: #{aspell.suggest(spelling_error)}"
        end
      end

      results
    end
  end
end
