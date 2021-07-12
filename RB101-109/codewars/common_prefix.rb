# Write a method to find the longest common prefix amongst an array of strings
# if there is no common prefix, return an empty string ""
# all given inputs are in lowercase letters a-z
# Example:
# input: ["flower", "flow", "flight"]
# output: "fl"

def common_prefix(array)
  letters = array.shift.chars
  prefix = ''

  letters.each_with_index do |char, index|
    array.all? { |string| string[index] == char } ?  prefix << char : break
  end
  prefix
end

p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspieces", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"

# LS way

def common_prefix(array)
  result = []
  max_index = array.min_by { |string| string.size }.size
  (0..max_index).each do |index|
    current_char = array[0][index]
    if array.all? { |str| str[index] == current_char }
      result << current_char
    else
      return result.join('')
    end
    result.join('')
  end
end
