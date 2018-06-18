require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/note_controller')
require_relative('controllers/day_controller')
require_relative('controllers/todo_controller')
also_reload("./models/*")


#INDEX
get '/planner' do
  erb(:index)
end

#NEW
get "/planner/new" do
  erb(:new)
end

# #SHOW
# get "/planner/:id" do
#   @
# end
