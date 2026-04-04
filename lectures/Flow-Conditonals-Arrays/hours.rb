# start with most specific condition, and then make it broader as we go down

puts "What hour is it?"
hour = gets.chomp.to_i

# if hour < 12
#   puts "Good Morning"
# elsif hour > 20
#   puts "Good Evening"
# elsif hour > 12
#   puts "Good Afternoon"
# end

if hour > 0 && hour < 12 
  puts "Good Morning"
elsif hour > 12 && hour < 20
  puts "Good Afternoon"
else
  puts "Good Evening"
end