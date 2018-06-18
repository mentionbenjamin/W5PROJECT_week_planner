require("minitest/autorun")
require_relative("../note.rb")

class NoteTest < MiniTest::Test

  def setup()
    options = {
      "id" => 1,
      "title" => "Family Dinner at Grannies"
      "description" => "3pm, dress smart, all family attending"
    }
    @user = Note.new(options)
  end

  def test_title()
    assert_equal("Family Dinner at Grannies", @note.day())
  end

end
