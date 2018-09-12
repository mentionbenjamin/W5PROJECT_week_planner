require("minitest/autorun")
require_relative("../note.rb")

class NoteTest < MiniTest::Test

  def setup()
    options = {
               "id" => 1,
            "title" => "Dinner at Grannies",
      "description" => "3pm, dress smart, all family attending"
    }
    @note = Note.new(options)
  end

  def test_title()
    assert_equal("Dinner at Grannies", @note.title())
  end

end
