# if

# if condition
#   # output something if a condition is true
# end

# if !

# if !condition
  # output something that is executed if a condition is NOT met / false
# end

# unless

# unless condition
#   execute code UNTIL the condition is met / true
# end

# if / else

# if condition_is_true
#   output something
# else
#   output something for every other result
# end

# ternary operator
  # one line if / else statement
  # ideally when your output is short, readable and can be done on one line 

# condition ? output_when_true : output_when_false

# elsif
  # when we want to look at more than one specific condition

# if condition_1
#   output something
# elsif condition_2 # if condition_1 is false, but condition_2 is true
#   output something else
# else
#   output something else for all other cases.
# end

# case

# case whatever_we_want_to_look_at
# when 'something' then do something
# when something_else then something else
# else
#   for everything else
# end

# one line conditionals

# do something if condition
# do something unless condition

# multiple conditions 

# AND &&

# ALL conditions must be true, to return true

# true  && true             #=> true
# false && false            #=> false
# true  && false            #=> false
# false && true             #=> false
# true  && false && true    #=> ?

condition_1 = true
condition_2 = false
condition_3 = true

if condition_1 && condition_2 && condition_3
  puts "true"
else
  puts "false"
end

# multiple conditions

# OR ||

# Only one condition needs to be true to return true

# true  || true            #=> true
# false || false           #=> false
# true  || false           #=> true
# false || true            #=> true
# true  || false || true   #=> ?

if condition_1 || condition_2 || condition_3
  puts "true"
else
  puts "false"
end