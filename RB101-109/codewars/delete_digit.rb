# Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.
# For n = 152, the output should be 52
# For n = 1001, the output should be 101

def delete_digit(n)
  lowest = 10
  numbers = n.to_s.chars.map(&:to_i)

  numbers.reverse.each_with_index do |num, idx|
    if num < lowest || numbers.reverse[idx - 1] > num
      lowest = num
    end
  end
 
  numbers.join.sub!(lowest.to_s, '').to_i
end

p delete_digit(152)
p delete_digit(1001)
p delete_digit(10)
p delete_digit(924980)

# Option 2
def delete_digit(num)
  digits = num.to_s.chars
  (0...digits.size).map { |idx| (digits[0...idx] + digits[idx + 1..-1]).join.to_i }.max
end

# This option makes an array of all the potentials with one digit missing and then gets the largest using max
