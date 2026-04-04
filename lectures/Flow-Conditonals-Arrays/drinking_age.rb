# get an age
# tell the user whether they can drink or not

puts "What's your age?"
age = gets.chomp.to_i

if age >= 21
  puts "You can drink"
end

if !(age < 21)
  puts "You can drink"
end

unless age < 21
  puts "You can drink"
end

if age >= 21
  puts "You can drink"
else
  puts "Sorry, you are too young"
end

puts age >= 21 ? "You can drink" : "Sorry, you are too young"