require 'minitest/autorun'

module Reggit
  class TestCase < Minitest::Unit::TestCase
    def sample_output_a
      <<-HEREDOC
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   Rakefile
#	modified:   lib/reggit/command.rb
#	modified:   lib/reggit/commands/commit_difference_command.rb
#	modified:   lib/reggit/commands/status_command.rb
#	modified:   lib/reggit/router.rb
#	modified:   lib/reggit/status_view.rb
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	lib/reggit/text_range.rb
#	test/tc_text_range.rb
no changes added to commit (use "git add" and/or "git commit -a")
      HEREDOC
    end

    def sample_output_b
      <<-HEREDOC
# On branch master
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
#	renamed:    lib/reggit/router.rb -> lib/reggit/command_router.rb
#
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   lib/reggit.rb
#	modified:   lib/reggit/commands/status_command.rb
#	modified:   test/tc_status_command.rb
#
      HEREDOC
    end
  end
end
