require 'minitest/autorun'
require 'reggit/text_range'

class TestTextRange < Minitest::Unit::TestCase
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
end
