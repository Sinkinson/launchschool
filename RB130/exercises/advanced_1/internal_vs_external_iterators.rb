# In this exercise your task is to create a new Enumerator object. When creating a new Enumerator, you may define what values are
# iterated upon. We'll want to create an Enumerator that can iterate over an infinite set of factorials. Once you make this new
# Enumerator, test it out by printing out the first 7 factorial values, starting with zero factorial.

# More specifically, print the first 7 factorials by using an "External Iterator". Once you have done so, see what happens if you
# print 3 more factorials (the results won't be correct). Now, reset your Enumerator (use the rewind method). Finally, print 7 more
# factorials.

# A factorial is a mathematical operation that involves multiplying a bunch of sequential positive numbers together. They are usually
# written as a non-negative integer followed by an exclamation point, e.g., 4!. The values look like this:

# n	n!	notes
# 0	1	  By definition, 0! is 1
# 1	1	  By definition, 1! is 1
# 2	2	  2! = 2 * 1
# 3	6	  3! = 3 * 2 * 1
# 4	24	4! = 4 * 3 * 2 * 1
# 5	120	5! = 5 * 4 * 3 * 2 * 1

# you only need 3 Enumerator methods to complete this exercise
# An enumerator also implements the Enumerable module. Keep this in mind, as it may make certain parts of this exercise easier to write.

factorials = Enumerator.new do |y|
  a = b = c = 1
  loop do
    y << a
    a = b
    c += 1
    b = (1..c).inject(:*)
  end
end

# external iterators
7.times do |number|
  puts "#{number}! == #{factorials.next}"
end

3.times do |number|
  puts "#{number}! == #{factorials.next}"
end

factorials.rewind

7.times do |number|
  puts "#{number}! == #{factorials.next}"
end

# internal interators
factorials.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end

# option 2
factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end
