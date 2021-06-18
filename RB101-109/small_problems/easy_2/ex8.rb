# write a program that asks the user to enter an integer greater than 0
# then ask if the user wants to determine the sum or product of all numbers
# between 1 and the entered integer

def prompt(msg)
  puts ">> #{msg}"
end

loop do
  prompt("Please enter an integer greater than 0:")
  integer = gets.chomp.to_i
  prompt("Enter 's' to compute the sum, 'p' to compute the product")
  answer = gets.chomp.downcase

sum = 0
product = 1

  for i in 1..integer
    sum += i
    product *= i
  end

  if answer == 's'
    puts "The sum of the integers between 1 and #{integer} is #{sum}"
    break
  elsif answer == 'p'
    puts "The product of the integers between 1 and #{integer} is #{product}"
    break
  else
    puts "Incorrect input, try again"
  end
end

# another way in which it could be done with methods using inject

# def sum(number)
#   (1..number).to_a.inject(:+)
# end

# def product(number)
#   (1..number).to_a.inject(:*)
# end

# prompt("Please enter an integer greater than 0:")
# integer = gets.chomp.to_i
# prompt("Enter 's' to compute the sum, 'p' to compute the product")
# answer = gets.chomp.downcase

# if answer == 's'
#   sum = sum(integer)
#   puts "The sum of the integers between 1 and #{integer} is #{sum}"
# elsif answer == 'p'
#   product = product(integer)
#   puts "The product of the integers between 1 and #{integer} is #{product}"
# else
#   "Wrong input"
# end
