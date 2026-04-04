# store the options of the coin
options = ["heads", "tails"]
# randomly choose an option
result = options.sample
# ask the user for heads or tails
puts "Heads or tails?"
# get the user response 
user_choice = gets.chomp
# tell them the result
puts result

# if user_choice == result
#   puts "You win"
# else
#   puts "You lose"
# end

puts user_choice == result ? "You Win" : "You lose"