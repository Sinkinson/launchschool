# write a method which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number
# at any place in num1 and also a straight double of the same number in num2.
# If this isn't the case, return 0

def triple_double(num1, num2)
  triples = num1.to_s.chars.each_cons(3).select { |sub_arr| sub_arr.uniq.size == 1 }.join
  doubles = num2.to_s.chars.each_cons(2).select { |sub_arr| sub_arr.uniq.size == 1 }.flatten
  triples.chars.each { |digit| return 1 if doubles.include?(digit) }
  0
end

p triple_double(888570624459366682850, 6627) == 1
p triple_double(451999277, 41177722899) == 1
p triple_double(1222345, 12345) == 0
p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(10560002, 100) == 1
p triple_double(1112, 122) == 0
p triple_double(5633690474633367393633467979118,  5336936081382) == 1

# option 2 (different way of getting triples and doubles)
def get_substrings(number, size)
  substrings = []
  (0..number.to_s.size).each do |start|
    (size..number.to_s.size - start).each do |length|
      substrings << number.to_s[start, length] unless number.to_s[start, length].size > size
    end
  end
  substrings
end

def triple_double(num1, num2)
  triples = get_substrings(num1, 3).select { |num| num.chars.all? { |char| char == num[0] }}
  doubles = get_substrings(num2, 2).select { |num| num.chars.all? { |char| char == num[0] }}
  triples.join.chars.each { |triple| return 1 if doubles.join.include?(triple) }
  0
end

# option 3 (iterate from 0 to 9 and multiply the current iteration number to see if the given numbers contain the triple and double respectively)
def triple_double(num1,num2)
  num1 = num1.to_s
  num2 = num2.to_s
  10.times { |i| return 1 if num1.include?(i.to_s*3) && num2.include?(i.to_s*2) }
  0
end
