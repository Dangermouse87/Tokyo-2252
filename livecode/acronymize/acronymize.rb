# Goal -> is to turn a string into an acronym 

# Kentucky Fried Chicken => KFC

# method -> 1) name, 2) parameters, 3) what are we returning

def acronymize(string)
  # Pseudocode
  # Split the string into an array
  array = string.split(" ")
  # Iterate over the array, grab every first letter
  new_array = []
  array.each do |word|
    word.chr[0]
    new_array << word.chr[0]
  end
  # Put every first letter into a new array
  # join the array back into a string
  new_array.join.upcase
end

# Refactored acronomize

def acronymize(string)
  letters = []
  string.split.each { |word| letters << word[0] }
  letters.join.upcase
end

# Tests
p acronymize("").class == String
p acronymize("Kentucky Fried Chicken") == "KFC"
p acronymize("oh MY god") == "OMG"
p acronymize("laughing my ass off") == "LMAO"
p acronymize("gangster") == "G" 