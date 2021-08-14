# Update the following code so that instead of printing the values each statement prints the name of the class to which is belongs

puts "Hello"
puts 5
puts [1, 2, 3]

# Expected output

# String
# Integer
# Array

# solution
puts "Hello".class
puts 5.class
puts [1, 2, 3].class

# All values are objects. Each object is an instance of a class
# To find the class of an object we just need to invoke the class method
