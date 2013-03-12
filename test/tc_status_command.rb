require 'minitest/autorun'
require 'reggit/command'
require 'reggit/commands/status_command'

class Test_Status_Command < Minitest::Unit::TestCase
  SAMPLE_OUTPUT = <<-HEREDOC
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


  def test_untracked_files
    status_command = Reggit::StatusCommand.new
    status_command.instance_variable_set(:@output, SAMPLE_OUTPUT)
    untracked_files = status_command.untracked_files

    assert(untracked_files.is_a? Array)
    message = untracked_files.first[:filename]
    p untracked_files
    assert(untracked_files.first[:filename] == "lib/reggit/text_range.rb")
  end
end
