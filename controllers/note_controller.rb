require('sinatra')
require( 'sinatra/contrib/all' )
require_relative('../models/todo')
require_relative('../models/note')
require_relative('../models/day')
require('pry')
also_reload("./models/*")


#INDEX
get '/notes' do
  @notes = Note.all
  erb(:'notes/index')
end

get '/notes/:id' do
  @note = Note.find(params['id'].to_i)
  erb(:'notes/show')
end

post '/notes/:id/delete' do # delete
  note = Note.find(params[:id])
  note.delete()
  redirect to '/notes'
end
