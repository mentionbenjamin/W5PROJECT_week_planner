require_relative("../models/note.rb")
require_relative("../models/day.rb")
require_relative("../models/todo.rb")
require("pry")

# Todo.delete_all()
# Note.delete_all()
# Day.delete_all()

note1 = Note.new({
  "title" => "Family Roast at 3pm",
  "description" => "Be on time, well dressed",
})
note2 = Note.new({
  "title" => "Pick up Trousers",
  "description" => "Before 12pm as closed in afternoon!",
})

note1.save()
note2.save()

day1 = Day.new({
  "day" => "Sunday"
})
day2 = Day.new({
  "day" => "Monday"
})
day3 = Day.new({
  "day" => "Tuesday"
})
day4 = Day.new({
  "day" => "Wednesday"
})
day5 = Day.new({
  "day" => "Thursday"
})
day6 = Day.new({
  "day" => "Friday"
})
day7 = Day.new({
  "day" => "Saturday"
})

day1.save()
day2.save()
day3.save()
day4.save()
day5.save()
day6.save()
day7.save()


todo1 = Todo.new({
  "note_id" => note1.id,
  "day_id" => day1.id
})

todo2 = Todo.new({
  "note_id" => note2.id,
  "day_id" => day2.id
})

todo1.save()
todo1.save()


binding.pry
nil
