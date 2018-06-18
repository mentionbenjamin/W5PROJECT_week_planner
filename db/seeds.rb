require_relative("../models/note.rb")
require_relative("../models/day.rb")
require_relative("../models/calendar.rb")
require("pry")

# Calendar.delete_all()
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
  "day" => "Monday"
})
day2 = Day.new({
  "day" => "Tuesday"
})

day1.save()
day2.save()

calendar1 = Calendar.new({
  "note_id" => note1.id,
  "day_id" => day1.id
})

calendar2 = Calendar.new({
  "note_id" => note2.id,
  "day_id" => day2.id
})

calendar1.save()
calendar2.save()


binding.pry
nil
