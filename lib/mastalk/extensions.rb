require 'erb'

module Mastalk
  # Extension DSL for adding new
  # mastalk snippets.
  #
  # Add new snippets in the form:
  # # start_tag, end_tag, new_line_ending
  #
  # <p>replacement html <%= body %></p>
  module Extensions
    SNIPPETS_FOLDER = File.join(File.dirname(__FILE__), 'snippets')
    @@extensions = []

    def extension(start, stop = nil, &block)
      re_start = Regexp.escape(start)
      re_stop = Regexp.escape(stop || start)
      regex = Regexp.new("#{re_start}(.*?)(#{re_stop}+)", Regexp::MULTILINE)
      @@extensions << [regex, block]
    end

    def extensions
      return @@extensions unless @@extensions.empty?

      Dir.foreach(SNIPPETS_FOLDER) do |file|
        next if file == '.' || file == '..'

        content = File.read(File.join(SNIPPETS_FOLDER, file))
        start, stop = args(content)
        erb = ERB.new(remove_syntax_from(content))
        extension(start, stop) do |body|
          body_lines = body.strip.gsub(/(\n|\r)+/, "\n").split(/\n/)
          erb.result(binding)
        end
      end

      @@extensions
    end

    def args(content)
      content.match(/#(.*)\n\n/m).captures.first.split(',').map(&:strip)
    end

    def remove_syntax_from(content)
      content.split(/#(.*)\n\n/).last
    end
  end
end
