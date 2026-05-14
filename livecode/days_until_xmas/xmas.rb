# Calculate how many days there are left until Xmas! (267)

# 5) Require the date library
require "date"
# Methods -> 1) name, 2) parameters (does it need extra information), 3) What should it return

# Getting the days 
def days_until_xmas
  # Pseudocode - breaking down a problem, into smaller more manageable step, describe in pure English
  # TODO
  # 1) Get Xmas Day -> as a value
  xmas = Date.new(2026, 12, 25)
  # 2) Get today -> as a value
  today = Date.today
  # 3) Get the difference between the days (subtract them)
  difference = xmas - today
  # 4) Convert the value into an integer (from a rational)
  difference.to_i
end

# Making it dynamic -> inputting your own date -> adding a parameter for a custom date
# def days_until_xmas(year, month, day) # adding parameters to be more dynamic
#   xmas = Date.new(2026, 12, 25)
#   date = Date.new(year, month, day)
#   difference = xmas - date
#   difference.to_i
# end

# Calling the method
p days_until_xmas
# p days_until_xmas(2021, 5, 9) # Don't forget parameters (like I did)

# Our base tests
puts "Returns an integer"
p days_until_xmas.class == Integer
# p days_until_xmas(2021, 5, 9).class == Integer # Don't forget parameters (like I did)

puts "Calculates the correct number from April 2 2026"
p days_until_xmas == 267