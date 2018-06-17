require_relative("../models/user.rb")
require_relative("../models/day.rb")
require("pry")

day1 = Day.new({
  "day" => "Monday"
})

day2 = Day.new({
  "day" => "Tuesday"
})

day1.save()
day2.save()

user1 = User.new({
  "title" => "Family Roast at 3pm",
  "description" => "Be on time, well dressed",
  "day_id" => day1.id
})

user2 = User.new({
  "title" => "Pick up Trousers",
  "description" => "Before 12pm as closed in afternoon!",
  "day_id" => day2.id
})

user1.save()
user2.save()


binding.pry
nil
