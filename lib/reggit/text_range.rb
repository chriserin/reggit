module Reggit
  class TextRange
    def initialize(start_text, end_text)
      @start_text, @end_text = start_text, end_text
    end

    def range_regex
      return %r{#{@start_text}.*?\n(.*$)}m if @end_text == "EOF"
      %r{#{@start_text}.*?\n(.*\n)(.*#{@end_text}.*?\n)}m
    end

    def lines(text)
      match = text.match(range_regex)
      return match[1].lines if match
      return []
    end
  end
end
