# Given a string of integers, return the number of substrings that form an odd number.
# For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

def solve(string)
  substrings = []
  (0..string.size - 1).each do |idx1|
    (idx1..string.size - 1).each do |idx2|
      substrings << string[idx1..idx2]
      end
    end
  substrings.select { |string| string.to_i.odd? }.size
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28
