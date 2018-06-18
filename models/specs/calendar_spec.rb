require("minitest/autorun")
require_relative("../calendar.rb")
require_relative("../note.rb")
require_relative("../day.rb")

class CalendarTest < MiniTest::Test

  def setup()
    options = {
      "id" => 1,
      "note_id" => @note_id,
      "day_id" => @day_id
    }
    @calendar = Calendar.new(options)
  end

  def test_calendar()
    assert_equal(1, @calendar.id())
  end

end
