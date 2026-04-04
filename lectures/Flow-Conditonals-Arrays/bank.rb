puts "Choose an option: [ balance | pin | withdraw | transfer ]"
choice = gets.chomp

# if choice == "balance"
#   puts "Your balance is ......"
# elsif choice == "pin"
#   puts "Change your pin"
# elsif choice == "withdraw"
#   puts "Withdraw money"
# elsif choice == "transfer"
#   puts "Transfer money"
# else
#   puts "Wrong Option"
# end

case choice # when is doing the same as choice == in the if/elsif
when "balance" then puts "Your balance is......."
when "pin" then puts "Change your pin"
when "withdraw" then puts "Withdraw money"
when "transfer" then puts "Transfer money"
else
  puts "Wrong option"
end