require 'reggit/command'
require 'reggit/status_view'

module Reggit
  class Router
    def status
      check_success(status = StatusCommand.run)
      check_success(commit_difference = CommitDifferenceCommand.run(status.branch))
      StatusView.render(status, commit_difference)
    end

    private
    def check_success(command)
      exit $?.exitstatus unless $?.success?
    end
  end
end
