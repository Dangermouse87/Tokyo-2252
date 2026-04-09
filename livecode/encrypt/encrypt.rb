# 1) Method Name -> encrypt
# 2) Parameters -> text / string
# 3) What are we returning -> string


# *************** LIVECODE *******************

def encrypt(text)
  # make an array from the alphabet
  alphabet = ("A".."Z").to_a
  encrypted = []
  # split the text string into an array of letters
  text.chars.each do |letter|
    # iterate over each letter, to find the correct index
    index = alphabet.index(letter)
    # check if an index is returned, if it isn't, then it isn't a letter
    if index
    # shift the index of each letter back by 3
      new_index = index - 3
      new_letter = alphabet[new_index]
      encrypted << new_letter
    else
      encrypted << letter
    end
    # join them back into a string
  end
  encrypted.join
end

p encrypt("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")

# *************** REFACTORED *******************

# We can create a CONSTANT, which cannot be reassigned but can be used in any method on the file
ALPHABET = ("A".."Z").to_a

def encrypt(text)
	text.chars.map do |letter|
		index = ALPHABET.index(letter) # find the index
		index ? ALPHABET[index - 3] : letter # if there is an index, find the letter 3 before, or if not, return the letter if it is a space
	end.join # join
end

encrypt("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")

# *************** DECRYPT ************************

def decrypt(text)
  # get the alphabet (you can use the constant above or initialize your own array)
  # split the text
  # iterate over the letters to get the correct index ( 3 forward )
  # join the letters back to a string
  # NOTE - What happens if you try to shift X, Y and Z? What can we do?
end