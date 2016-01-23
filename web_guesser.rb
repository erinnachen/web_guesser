require 'sinatra'
require 'sinatra/reloader'
require 'pry'

number = rand(100)

get '/' do
  guess = params["guess"]
  message = "Please guess a number:"
  if guess
    guess = guess.to_i
    if guess > number + 5
      message = "Way too high!"
    elsif guess > number
      message = "Too high!"
    elsif guess < number - 5
      message = "Way too low!"
    elsif guess < number
      message = "Too low!"
    else
      message = "You got it right!"
    end
  end

  #message = check_guess(guess)
  erb :index, :locals => {number: number, message: message}
end


# def check_guess(guess)
#   message = "Please guess a number:"
#   return message unless guess
#   guess = guess.to_i
#   # if guess > @number
#   #   if guess> @number + 5
#   #     message = "Way too high!"
#   #   else
#   #     message = "Too high!"
#   #   end
#   # elsif guess < @number
#   #   if guess < @number - 5
#   #     message = "Way too low!"
#   #   else
#   #     message = "Too low!"
#   #   end
#   # else
#   #   message = "You got it right!"
#   # end
# end
