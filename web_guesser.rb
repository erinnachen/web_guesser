require 'sinatra'
require 'sinatra/reloader'
require 'pry'

set :SECRET_NUMBER, rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {number: number, message: message}
end

def number
  settings.SECRET_NUMBER
end

def check_guess(guess)
  return "Please guess a number:" unless guess
  guess = guess.to_i
  if guess > number + 5
    "Way too high!"
  elsif guess > number
    "Too high!"
  elsif guess < number - 5
    "Way too low!"
  elsif guess < number
    "Too low!"
  else
    "You got it right!"
  end
end
