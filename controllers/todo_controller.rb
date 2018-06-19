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
  @note = Note.all
  @day = Day.all
  erb(:'todo_list/new')
end

#SAVE
post "planner" do
  todo = Todo.new(params)
  todo.save
  redirect to("/planner")
end

#CREATE
post '/planner' do # create
  @todo = Todo.new(params)
  @todo.save()
  redirect to("/planner")
end

# get "/planner/:day_id" do
#
# end
