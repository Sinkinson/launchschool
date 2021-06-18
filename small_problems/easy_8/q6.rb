# Write a method that takes two arguments: the first is the starting number,
# and the second is the ending number. Print out all the numbers between the
# two numbers, except if a number is divisible by 3, print "Fizz", if a number
# is divisible by 5 print "Buzz", and finally if the number is divisible by
# 3 and 5 print "FizzBuzz"

def fizzbuzz(num_1, num_2)
  for i in num_1..num_2
    if i % 3 == 0 && i % 5 == 0
      print "FizzBuzz, "
    elsif i % 3 == 0
      print "Fizz, "
    elsif i % 5 == 0
      print "Buzz, "     
    else
      print i, ", "
    end
  end
end

# test case
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# LS way

def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end

# notice that in this solution we do not have a value next to case for comparison
# when used in this form it provides the same functionality as an if/elsif/else statement
