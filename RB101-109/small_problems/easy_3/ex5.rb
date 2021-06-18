# write a method using the multiply method in ex4 that returns square of its argument

def multiply(n1, n2)
  n1 * n2
end

def square(n)
  multiply(n, n)
end

def power(num, power)
  multiply(num, 1)**power
end

puts square(5) == 25
puts square(-8) == 64
puts power(2, 4) == 16