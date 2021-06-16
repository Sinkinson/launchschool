# write a method that will take a short line of text and print it within a box
# you may assume that the input will always fit in your terminal window

def print_in_box(message)
  horizontal_rule = "+#{ '-' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_rule
end

# test case

print_in_box('To boldly go where no one has gone before.')

#+--------------------------------------------+
#|                                            |
#| To boldly go where no one has gone before. |
#|                                            |
#+--------------------------------------------+

# line 6 creates a string of message.size + 2 hyphens

# truncate the string to 80 characters to fit standard terminal window

def print_in_box(message)
  message = message[0..80]
  horizontal_rule = "+#{ '-' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_rule
end
