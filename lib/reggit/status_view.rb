require 'rainbow'

module Reggit
  class StatusView
    TEMPLATE = <<-HEREDOC
              BRANCH_INFO

      ======= staged      ============================
        STAGED_FILES
      ======= changed     ============================
        CHANGED_FILES
      ======= untracked   ============================
        UNTRACKED_FILES
    HEREDOC

    def render(status, commit_difference)
      result = TEMPLATE.gsub('STAGED_FILES', render_files(status.staged_files))
      result = result.gsub('CHANGED_FILES', render_files(status.changed_files))
      result = result.gsub('UNTRACKED_FILES', render_files(status.untracked_files))
      result = result.gsub('BRANCH_INFO', render_branch_info(commit_difference.count, status.branch))
    end

    def render_branch_info(commit_difference_count, branch)
      branch = "  #{branch}  "

      colored_branch_master = "  master  ".background(:red).color(:black)
      unless branch =~ /master/
        colored_branch = branch.background('997100')
        "\t\t\t\t #{colored_branch_master}#{"." * commit_difference_count}#{colored_branch}"
      else
        "\t\t\t\t #{colored_branch_master}"
      end
    end

    def render_files(files)
      return "" if files.size == 0
      result = ?\n
      for file in files
        result << "\t #{file[:desc].color(:cyan)}  #{file[:filename]}\n"
      end
      result
    end
  end
end
