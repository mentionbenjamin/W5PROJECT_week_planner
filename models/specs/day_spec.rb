require("minitest/autorun")
require_relative("../day.rb")

class DayTest < MiniTest::Test

  def setup()
    options = {
      "id" => 1,
      "day" => "Monday"
    }
    @day = Day.new(options)
  end

  def test_day()
    assert_equal("Monday", @day.day())
  end

end
