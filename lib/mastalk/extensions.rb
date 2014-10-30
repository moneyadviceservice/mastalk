require 'erb'

module Mastalk
  # Extension DSL for adding new
  # mastalk syntax
  module Extensions
    @@extensions = []

    def extension(start, stop = nil, new_line = false, &block)
      re_start = Regexp.escape(start)
      re_stop = stop == '$' ? stop : Regexp.escape(stop || start)
      regex = Regexp.new("#{re_start}(.*)(#{re_stop})", new_line ? 0 : Regexp::MULTILINE)
      @@extensions << [regex, block]
    end

    def extensions
      return @@extensions unless @@extensions.empty?

      Dir.foreach(File.join(File.dirname(__FILE__), 'snippets')) do |file|
        next if file == '.' || file == '..'
        content = File.read(File.join(File.dirname(__FILE__), 'snippets', file))
        start, stop, new_line = args(content)
        content = remove_syntax_from(content)
        extension(start, stop, new_line == 'false') do |body|
          ERB.new(content).result(binding)
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
