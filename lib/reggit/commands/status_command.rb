module Reggit
  class StatusCommand < Command
    def process_command(*args)
      @output = `git status`
    end

    def branch
      regex = /branch (.*)/
      @output.lines.first.match(regex)
      return $1
    end

    def staged_files
      range = TextRange.new("Changes to be committed", "Changes not staged")
      git_files(range)
    end

    def changed_files
      range = TextRange.new("Changes not staged", "Untracked files")
      git_files(range)
    end

    def untracked_files
      range = TextRange.new("Untracked files", "EOF")
      git_files(range)
    end

    private
    def git_files(text_range, file_descriptor_should_exist=true)
      results = []
      result_lines = text_range.lines(@output)

      result_lines.each do |line|
        next unless not line =~ /\(.*\)/ and line.length > 4
        if file_descriptor_should_exist
          line.match(/#\s*([\w\s]*):\s*([.\w\d_:\/-]*)/)
          results << {filename: $2, desc: get_descriptor($1)}
        else
          line.match(/#\s*([.\w\d_:\/-]*)/)
          results << {filename: $1, desc: '   '}
        end
      end

      return results
    end

    def get_descriptor(desc)
      case desc
      when 'new file'
        'NEW'
      when 'modified'
        'MOD'
      when 'deleted'
        'DEL'
      else
        'XXX'
      end
    end

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
        match[1]
      end
    end
  end
end
