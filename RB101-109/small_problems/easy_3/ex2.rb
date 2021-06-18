# Write a program that prompts the user for two positive integers
# it then prints the results of the following operations on those two numbers
#  - addition
#  - subtraction
#  - product
#  - quotient
#  - remainder
#  - power

puts ">> Enter the first number:"
first_num = gets.chomp.to_i
puts "Enter the second number:"
second_num = gets.chomp.to_i

puts "#{first_num} + #{second_num} = #{first_num + second_num}"
puts "#{first_num} + #{second_num} = #{first_num - second_num}"
puts "#{first_num} + #{second_num} = #{first_num * second_num}"
puts "#{first_num} + #{second_num} = #{first_num / second_num}"
puts "#{first_num} + #{second_num} = #{first_num % second_num}"
puts "#{first_num} + #{second_num} = #{first_num ** second_num}"

# A more concise way

# puts "First number:"
# first_number = gets.chomp
# puts "Second number:"
# second_number = gets.chomp

# operations = ['+', '-', '*', '/', '%', '**']

# operations.each do |operation|
#   puts "#{first_number} #{operation} #{second_number} = #{eval(first_number + operation + second_number)}"
# end