require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/note_controller')
require_relative('controllers/day_controller')
require_relative('controllers/todo_controller')
also_reload("./models/*")

get '/' do
  redirect "/planner/new"
end
