require 'kramdown'
require 'htmlentities'
require 'mastalk/extensions'

module Mastalk
  # Document class to preprocess
  # mastalk specific syntax
  class Document
    include Mastalk::Extensions

    attr_reader :source

    def initialize(source)
      @source = source.dup
    end

    def to_html(options = {})
      auto_ids = options[:auto_id].nil? ? true : options[:auto_ids]
      kramdown = Kramdown::Document.new(
        preprocess(source),
        auto_ids: auto_ids
      )
      html, _ = Kramdown::Converter::Html.convert(kramdown.root, kramdown.options)
      ::HTMLEntities.new.decode(html)
    end

    private

    def preprocess(source)
      extensions.each do |regex, block|
        while source.match(regex)
          source.sub!(regex, block.call(Regexp.last_match.captures.first).strip)
        end
      end
      source
    end
  end
end
