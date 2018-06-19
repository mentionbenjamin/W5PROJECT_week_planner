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

get '/days/:id' do
  @day = Day.find(params['id'].to_i)
  erb(:'days/show')
end


# do loop to display all day notes
