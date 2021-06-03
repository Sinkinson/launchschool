# write a program that solicits 6 numbers from the user
# it prints a message that describes whether or not the
# 6th number appears amongst the first five numbers

def clear
  system('clear')
end

loop do
  puts "You will now be asked for 6 numbers"
  print "Press the enter key to continue "
  answer = gets.chomp
  break if answer == ''
end

clear

i = 1
numbers = []
loop do
  puts ">> Enter number #{i}: "
  number = gets.chomp.to_i
  numbers << number
  i += 1
  break if i > 6
end

last_number = numbers.pop
if numbers.include?(last_number)
  puts "The number #{last_number} appears in #{numbers}"
else
  puts "The number #{last_number} does not appear in #{numbers}"
end

# LS way

# numbers = []

# puts "Enter the 1st number:"
# numbers << gets.chomp.to_i
# puts "Enter the 2nd number:"
# numbers << gets.chomp.to_i
# puts "Enter the 3rd number:"
# numbers << gets.chomp.to_i
# puts "Enter the 4th number:"
# numbers << gets.chomp.to_i
# puts "Enter the 5th number:"
# numbers << gets.chomp.to_i
# puts "Enter the last number:"
# last_number = gets.chomp.to_i

# if numbers.include? last_number
#   puts "The number #{last_number} appears in #{numbers}."
# else
#   puts "The number #{last_number} does not appear in #{numbers}."
# end
