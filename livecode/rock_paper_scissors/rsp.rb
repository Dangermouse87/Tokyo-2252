# Rock, Scissors, Paper

# PSEUDOCODE

# store all of the choices (array)
choices = ['paper', 'rock', 'scissors']

# initialize loop entry
playing = "y"
# loop
while playing == "y"
  # ask the user for a choice
  puts 'Give me your choice'
  # store the user choice
  user_choice = gets.chomp
  # get the computer choice **random** (sample)
  computer_choice = choices.sample
  # compare user choice and computer choice => conditional 
  # display a result
  if user_choice == computer_choice
    puts 'Draw'
  elsif user_choice == 'paper'
    if computer_choice == 'rock'
      puts 'You won'
    elsif computer_choice == 'scissors'
    puts 'You lost'
    end
  elsif user_choice == 'rock'
    if computer_choice == 'scissors'
      puts 'You won'
    elsif computer_choice == 'paper'
      puts 'You lost'
    end
  elsif user_choice == 'scissors'
    if computer_choice == 'paper'
      puts 'You won'
    elsif computer_choice == 'rock'
      puts 'You lost'    
    end
  end
  puts "Do you want to play again? y / n"
  playing = gets.chomp
end

# Refactored

while play_again == "y"
  user_choice = nil
  until choices.include?(user_choice)
    puts "Choose either rock, paper, scissors"
    user_choice = gets.chomp.downcase
  end
  com_choice = choices.sample
  user_wins =
    case user_choice
    when 'rock' then com_choice == "scissors"
    when 'paper' then com_choice == "rock"
    when 'scissors' then com_choice == "paper"
    end

  puts "computer choose #{com_choice}"
  if user_choice == com_choice
    puts "It's a draw"
  elsif user_wins
    puts "You win!:)"
  else
    puts "You lost:("
  end
  puts "Do you want to play again? (y/n)"
  play_again = gets.chomp.downcase
end

