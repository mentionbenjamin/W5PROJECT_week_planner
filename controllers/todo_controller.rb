require('sinatra')
require( 'sinatra/contrib/all' )
require_relative('../models/todo')
require_relative('../models/note')
require_relative('../models/day')
require('pry')
also_reload("./models/*")

#INDEX
get '/planner' do
  @note = Note.all
  @day = Day.all
  erb(:index)
end

#NEW
get "/planner/new" do
  @days = Day.all
  erb(:'todo_list/new')
end

#CREATE
post "/planner" do
  note = Note.new(params)
  note.save()
  params["note_id"] = note.id
  for day in params["day_array"]
    params["day_id"] = day
    todo = Todo.new(params)
    todo.save
  end
  redirect to("/planner/new#reference-to-form")
end
