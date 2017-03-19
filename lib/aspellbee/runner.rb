require 'worte'

module Aspellbee
  class Runner
    def run_on_file(file)
      results = []

      markdown_filter = Worte::Filter::Markdown.new

      content_filter = markdown_filter.filter(File.read(file))

      # content_filter.gsub!(/^[\d+\.*\d+]+$/,' ')
      # content_filter.gsub!(/~~~/,'')

      url_filter = Worte::Filter::URL.new
      markdown_filter = Worte::Filter::Markdown.new

      content_filter = url_filter.filter(content_filter)
      content_filter = markdown_filter.filter(content_filter)

      tokens = Worte::Worte.new('en').check(content_filter)

      printer = Worte::Printer::Colorized.new

      red_underline(content_filter, tokens)
    end

    private

    def error_marker(length)
      "\e[31m" + ('^' * length) + "\e[0m"
    end

    def red_underline(text, tokens, where = STDOUT)
      text.split("\n").each_with_index do |line, l|
        line_tokens = tokens.select { |t| t.position[0] == l }
        if line_tokens.map(&:correct).all?
          next # Do not print lines without errors
        end
        where.print "#{l + 1}: "
        where.puts line
        col = 0
        where.print ' ' * ((l + 1).to_s.length + 2)
        line_tokens.each do |token|
          next if token.correct
          if col != token.position[1]
            where.print (' ' * (token.position[1] - col))
            col = token.position[1]
          end
          where.print error_marker(token.word.length)
          col += token.word.length
        end
        where.puts
      end
    end
  end
end
