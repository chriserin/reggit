require File.expand_path('../helper', __FILE__)

require 'reggit/command'
require 'reggit/commands/status_command'

class Test_Status_Command < Reggit::TestCase

  def test_untracked_files
    status_command = Reggit::StatusCommand.new
    status_command.instance_variable_set(:@output, sample_output_a)
    untracked_files = status_command.untracked_files

    assert(untracked_files.is_a? Array)
    message = untracked_files.first[:filename]
    assert(untracked_files.first[:filename] == "lib/reggit/text_range.rb")
  end

  def skip_test_changed_not_staged_files
    status_command = Reggit::StatusCommand.new
    status_command.instance_variable_set(:@output, sample_output_b)
    changed_files = status_command.changed_files

    assert(changed_files.is_a? Array)
    message = changed_files.first[:filename]
    assert(changed_files.first[:filename] == "lib/reggit.rb")
  end
end
