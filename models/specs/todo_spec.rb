require("minitest/autorun")
require_relative("../todo.rb")
require_relative("../note.rb")
require_relative("../day.rb")

class TodoTest < MiniTest::Test

  def setup()
    options = {
           "id" => 1,
      "note_id" => @note_id,
       "day_id" => @day_id
    }
    @todo = Todo.new(options)
  end

  def test_todo()
    assert_equal(1, @todo.id())
  end

end
