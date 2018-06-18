require_relative("../models/note.rb")
require_relative("../models/day.rb")
require("pry")

User.delete_all()
Day.delete_all()

day1 = Day.new({
  "day" => "Monday"
})

day2 = Day.new({
  "day" => "Tuesday"
})

day1.save()
day2.save()

note1 = User.new({
  "title" => "Family Roast at 3pm",
  "description" => "Be on time, well dressed",
  "day_id" => day1.id
})

note2 = User.new({
  "title" => "Pick up Trousers",
  "description" => "Before 12pm as closed in afternoon!",
  "day_id" => day2.id
})

note1.save()
note2.save()


binding.pry
nil
