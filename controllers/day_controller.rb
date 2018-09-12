require('sinatra')
require( 'sinatra/contrib/all' )
require_relative('../models/todo')
require_relative('../models/note')
require_relative('../models/day')
require('pry')
also_reload("./models/*")


#INDEX
get '/days' do
  @days = Day.all
  erb(:'days/index')
end

#SHOW
get '/days/:id' do
     @days = Day.all
      @day = Day.find(params['id'].to_i)
  @dayname = Day.find(@day.id()).day()
  erb(:'days/show')
end
