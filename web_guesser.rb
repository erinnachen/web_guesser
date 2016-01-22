require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

get '/' do
  "The SECRET NUMBER is #{number}"
end
