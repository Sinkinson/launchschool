# Write a method that takes two strings as arguments
# deteremines the longest of the two strings and then returns
# the results of concatenating the shorter string, the longer string
# and the shorter string once again
# assume the strings are of different lengths

def short_long_short(string1, string2)
  if string1.size > string2.size
    string2 + string1 + string2
  else
    string1 + string2 + string1 
  end
end

# test cases
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

# could also put the strings into an array and then sort the array by length

# def short_long_short(string1, string2)
#   arr = [string1, string2].sort_by { |el| el.length }
#   arr.first + arr.last + arr.first
# end
