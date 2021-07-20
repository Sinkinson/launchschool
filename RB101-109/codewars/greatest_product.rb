# Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

def greatest_product(n)
  substrings = []
  greatest = 0

  (0..n.size - 5).each do |start|
    substrings << n[start, 5]
  end

  substrings.each do |numbers|
    product = numbers.chars.map(&:to_i).inject(:*)
    greatest = product if product > greatest
  end

  greatest
end

p greatest_product("123834539327238239583") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

# could also use the each_cons method which iterates the given block for each array of <n> elements
def greatest_product(n)
  n.chars.each_cons(5).map { |a| a.map(&:to_i).reduce(:*) }.max
end
