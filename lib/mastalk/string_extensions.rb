# Add unindent method to String
module StringExtensions
  refine String do
    def unindent
      gsub(/^#{scan(/^[ \t]+(?=\S)/).min}/, '')
    end
  end
end
