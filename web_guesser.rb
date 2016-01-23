require 'sinatra'
require 'sinatra/reloader'

set :SECRET_NUMBER, rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  color = get_color(guess)
  erb :index, :locals => {number: number, message: message, color: color}
end

def number
  settings.SECRET_NUMBER
end

def get_color(guess)
  return "White" unless guess
  guess = guess.to_i
  if guess > number + 5
    "Red"
  elsif guess > number
    "Pink"
  elsif guess < number - 5
    "Blue"
  elsif guess < number
    "PowderBlue"
  else
    "LawnGreen"
  end
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
