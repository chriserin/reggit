require File.expand_path('../helper', __FILE__)

require 'reggit/text_range'

class TestTextRange < Reggit::TestCase
  def test_lines
    text = <<-HEREDOC
      gibberish
      aaa bbb ccc ddd
      first line
      second line
      eee fff ggg hhh
      gibberish
    HEREDOC

    range = Reggit::TextRange.new("bbb", "ggg")
    result = range.lines(text)

    desired_result = <<-HEREDOC.lines
      first line
      second line
    HEREDOC

    assert(result == desired_result)
  end

  def test_git_changed_files
    text = sample_output_b

    range = Reggit::TextRange.new("Changes not staged", "Untracked files")

    lines = range.lines(text)
    assert(lines.size == 7)
  end
end
