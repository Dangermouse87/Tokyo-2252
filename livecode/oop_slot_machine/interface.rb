require_relative "slot_machine_refactored"
# require_relative "slot_machine"

# turn your slot machine into a game, with a balance a replay loop

balance = 100
replay = "y"

puts "Welcome to the slot machine! You have #{balance} dollars."
while balance > 0 && replay == "y"
  balance -= 5
  slot_machine = SlotMachine.new( [SYMBOLS.sample, SYMBOLS.sample, SYMBOLS.sample] )
  puts "You got #{slot_machine.reels.join(" ")}"
  puts "You won #{slot_machine.score} dollars!" if slot_machine.score > 0
  balance += slot_machine.score
  puts "Your balance is #{balance}"
  puts "Do you want to play again? (y/n)"
  replay = gets.chomp
end

puts "You're out of money!" if balance <= 0
puts "Thank you for playing!" if replay != "y"