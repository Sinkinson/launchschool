# write a program that will ask for the user's name
# if the user appends name with ! the computer yells back to the user

print "What is your name? "
name = gets.chomp
if name.include?('!')
  name.delete!('!')
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}"
end

# line 6 could also be: if name[-1] == '!'
# line 7 could also be: name = name.chop
