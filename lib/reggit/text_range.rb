module Reggit
  class TextRange
    def initialize(start_text, end_text="EOF")
      @start_text, @end_text = start_text, end_text
    end

    def eof_regex
      %r{#{@start_text}.*?\n(.*$)}m
    end

    def range_regex
      %r{#{@start_text}.*?\n(.*\n)(.*#{@end_text}.*?\n)}m
    end

    def lines(text)
      match = text.match(range_regex)
      match = text.match(eof_regex) if match.nil?
      return match[1].lines if match
      return []
    end
  end
end
