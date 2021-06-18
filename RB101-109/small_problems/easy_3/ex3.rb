# Write a program that will ask the user for an input of a word or multiple words
# Have it give back the number of characters
# spaces should not be counted as characters

# get the user input
# save it to a variable
# delete all the spaces in that variable
# get the length of the string and display it back

print "Please write a word or multiple words: "
user_input = gets.chomp
string_length = user_input.delete(" ").length
puts "There are #{string_length} characters in \"#{user_input}\"."
