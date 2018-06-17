require("minitest/autorun")
require_relative("../user.rb")

class DayTest < MiniTest::Test

  def setup()
    options = {
      "id" => 1,
      "title" => "Family Dinner at Grannies"
      "description" => "3pm, dress smart, all family attending"
    }
    @user = User.new(options)
  end

  def test_title()
    assert_equal("Family Dinner at Grannies", @user.day())
  end

end
