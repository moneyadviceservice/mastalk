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
      # Attempt 2
      #
      extensions.each do |regex, block|
        while source.match(regex)
          source.sub!(regex, block.call(Regexp.last_match.captures.first).strip)
        end
      end

      # Attempt 1
      #
      #extensions.each do |regex, block|
      #  require 'pry-byebug'
      #  matches = source.to_enum(:scan, regex).map { Regexp.last_match }
      #  matches.each do |m|
      #    source.sub!(regex, block.call(m[1]).strip)
      #  end
      #end

      #extensions.map do |regex, block|
      #  if source.match(regex)
      #    source.sub!(regex, block.call(Regexp.last_match.captures.first).strip)
      #  end
      #end
      #preprocess(source) if extensions.any? {|regex, _| source.match(regex)}
      source
    end
  end
end
