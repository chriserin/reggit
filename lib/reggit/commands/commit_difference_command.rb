module Reggit
  class CommitDifferenceCommand < Command
    def process_command(branch)
      @output = `git log --oneline #{branch} ^master`
    end

    def count
      @output.lines.count
    end
  end
end
