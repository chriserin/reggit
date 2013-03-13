require 'reggit/command'
require 'reggit/status_view'

module Reggit
  class Router
    def status
      check_success(status = StatusCommand.run)
      check_success(commit_difference = CommitDifferenceCommand.run(status.branch))
      output = StatusView.new.render(status, commit_difference)
      puts output
    end

    private
    def check_success(command)
      unless $?.success?
        puts command.command_line + " failed"
        exit $?.exitstatus
      end
    end
  end
end
