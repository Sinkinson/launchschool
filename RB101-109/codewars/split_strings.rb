# Complete the solution so that it splits the string into pairs of two characters.
# If the string contains an odd number of characters then it should replace the
# missing second character of the final pair with an underscore ('_').

def solution(str)
  result = []
  start = 0
  return result if str.empty?

  (str.size.to_f / 2).ceil.times do
    result << str[start, 2]
    start += 2
  end
  
  result.last << '_' if result.last.size == 1
  result
end

p solution('abc')
p solution('abcdef')
p solution("abcdefg")
p solution("")

# using the scan method
def solution(str)
  str << '_' if str.length.odd?
  str.scan(/../)
end

# passing /../ to the scan method as an argument says to break the string into pairs and return them in an array
