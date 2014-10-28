require 'kramdown'
require_relative 'mastalk/extensions'

module Mastalk
  # Document class to preprocess
  # mastalk specific syntax
  class Document
    include Mastalk::Extensions

    attr_reader :source

    def initialize(source)
      @source = source.dup
    end

    def to_html
      kramdown_doc.to_html
    end

    private

    def kramdown_doc
      Kramdown::Document.new(preprocess(source))
    end

    def preprocess(source)
      extensions.map do |regex, block|
        if source.match(regex)
          source.gsub!(regex, block.call(Regexp.last_match.captures.first))
        end
      end
      source
    end
  end
end
