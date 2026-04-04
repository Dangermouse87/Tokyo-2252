# Arrays

# Arrays a list / collection of elements

# array = []


# How do we read them -> []

# CRUD
# Create
movies = []
movies = ["Children of Man", "Silent Voice", "Goodfellas", "Social Network"]
# index          0                  1              2               3

# Read
p movies[0] # First element
p movies[3] # Last element at the minute
p movies[-1] # Last element, no matter the amount of elements in the array
p movies[0..2] # slicing - returning a certain amount of elements
p movies.index("Silent Voice")

# Update
# add elements
movies << "Kill Bill vol. 1"
movies.push("Kill Bill vol. 2")
p movies

# change / alter element
movies[-1] = "1984" # change the value of the last element
p movies

# Delete / Destroy
movies.delete("1984") # deletes all entries in the array that are "1984"
movies.delete_at(-1) # deletes an element at the index

# Displaying array elements

# puts movies[0]
# puts movies[1]
# puts movies[2]
# puts movies[3]
# puts movies[4]

# Iterating - doing the same thing to each element in the array

# movies.each do |movie|
#   puts movie
# end

movies.each { |movie| movie.downcase }
p movies

movies.map { |movie| movie.downcase }

# size / count / length 

p movies.count
p movies.length
p movies.size

p movies.shuffle
p movies.sample
p movies.include?("Goodfellas")
p movies.include?("Spirited Away")
p movies.sort
puts movies.sort
