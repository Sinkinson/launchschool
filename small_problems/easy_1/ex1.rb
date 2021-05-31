# Create a method that takes two arguments
# One argument is a string the other a positive integer
# Then print the string as many times as the integer indicates

def repeat(string, num)
  num.times {puts string}
end

repeat("hello", 3)