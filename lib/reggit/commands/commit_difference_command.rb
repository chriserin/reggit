module Reggit
  class CommitDifferenceCommand < Command
    def process_command(branch)
      @command_line = "git log --oneline #{branch} ^master"
      @output = `#{command_line}`
    end

    def count
      @output.lines.count
    end
  end
end
