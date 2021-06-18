# Someone wrote a basic implementation of a fibonacci calculator below
# the calculator will keep computing the sequence until some limit is reached
# There is something wrong with the limit variable. What is it?

limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# The problem is that methods definitions have there own scope, so limit is unaccessible inside
# the method because it has not been passed in.
# So either it can be set as a parameter, like below. Or put inside the method definition itself

# limit = 15

# def fib(first_num, second_num, limit)
#   while first_num + second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end

# result = fib(0, 1, limit)
# puts "result is #{result}"
