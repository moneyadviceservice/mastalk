require_relative 'string_extensions'

module Mastalk
  # Extension DSL for adding new
  # mastalk syntax
  module Extensions
    using StringExtensions

    @@extensions = []

    def extension(start, stop = nil, new_lines = true, &block)
      re_start = Regexp.escape(start)
      re_stop = Regexp.escape(stop || start)
      regex = Regexp.new("#{re_start}(.*)(#{re_stop})", multiline(new_lines))
      @@extensions << [regex, block]
    end

    def multiline(new_lines)
      new_lines ? Regexp::MULTILINE : 0
    end

    def extensions
      return @@extensions unless @@extensions.empty?

      # Callout HEADER
      extension('$=') do |body|
        <<-END.unindent
          \n\n<div class="collapsible">
            <button class="unstyled-button">
              <span class="icon icon--toggle"></span>
              <span class="visually-hidden js-collapsable-hidden"></span>
              #{Mastalk::Document.new(body).to_html}
            </button>
          </div>\n
        END
      end

      # Callout body
      extension('$-') do |body|
        <<-END.unindent
          \n\n<div class='collapsible-section'>
            #{Mastalk::Document.new(body.strip).to_html}
          </div>\n
        END
      end

      extension('$collapsable') do |body|
        <<-END.unindent
          \n\n<div class='collapsable'>
            #{Mastalk::Document.new(body.strip).to_html}
          </div>\n
        END
      end

      # Callout
      extension('$=callout', '=$') do |body|
        <<-END.unindent
          <div class='callout'>
            #{Mastalk::Document.new(body.strip).to_html}
          </div>\n\n
        END
      end

      # Add-action
      extension('^') do |body|
        <<-END.unindent
          <div class='add-action'>
            #{Mastalk::Document.new(body.strip).to_html}
          </div>\n\n
        END
      end

      # Action item
      extension('$action', '$item') do |body|
        <<-END.unindent
          <div class='action-item'>
            #{Mastalk::Document.new(body.strip).to_html}
          </div>\n\n
        END
      end

      extension('$aheader') do |body|
        <<-END.unindent
          <h2>#{body}</h2>\n\n
        END
      end

      # Why
      extension('$why') do |body|
        <<-END.unindent
          <div class='why'>
            #{Mastalk::Document.new(body.strip).to_html}
          </div>\n\n
        END
      end

      # How
      extension('$how') do |body|
        <<-END.unindent
          <div class='how'>
            #{Mastalk::Document.new(body.strip).to_html}
          </div>\n\n
        END
      end

      # Benefits yes-no list
      extension('$yes-no', '$end') do |body|
        <<-END.unindent
          <ul class='yes-no'>
            #{Mastalk::Document.new(body).to_html}
          </ul>
        END
      end

      # Yes list item
      extension('[y]', "\n", false) do |body|
        <<-END.unindent
          <li class='yes'>#{body.strip.gsub("\n", '')}</li>
        END
      end

      # No list item
      extension('[n]', "\n", false) do |body|
        <<-END.unindent
          <li class='no'>#{body.strip.gsub("\n", '')}</li>
        END
      end

      #Embed video
      extension('({', '})') do |body|
        <<-END.unindent
          <video
            data-account="57838016001"
            data-player="c5049c84-4364-47bc-a169-53886c6d7fcd"
            data-embed="default"
            data-id="#{body}"
            class="video-js" controls>
          </video>
        END
      end
    end
  end
end
