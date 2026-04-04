# Guess a number between 1 - 10

# tell the user to choose a number
# get a random number
# tell them if they are correct or not

random = rand(1..10)

guess = nil

# while guess != random
until guess == random
  puts "Choose a number between 1 and 10"
  guess = gets.chomp.to_i

  if guess == random
    puts "Correct"
  else
    puts "Incorrect, try again"
  end
end