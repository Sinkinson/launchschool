# Mothers arranged a dance party for the children in school. At that party, there are only mothers and their children.
# All are having great fun on the dance floor when suddenly all the lights went out. It's a dark night and no one can
# see each other. But you were flying nearby and you can see in the dark and have ability to teleport people anywhere
# you want.

# Legend:
# -Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children are "aaaa".
# -Function input: String contains only letters, uppercase letters are unique.

# Task:
# Place all people in alphabetical order where Mothers are followed by their children, i.e. "aAbaBb" => "AaaBbb".

def find_children(dancing_brigade)
  result = []

  sorted_arr = dancing_brigade.chars.map(&:downcase).sort
  sorted_arr.each do |char|
    if result.last == char || result.last == char.upcase
      result << char
    else
      result << char.upcase
    end
  end

  result.join
end

p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""

# using slice_when method
def find_children(dancing_brigade)
  string = ''

  sorted_arr = dancing_brigade.chars.map(&:downcase).sort
  sorted_arr.slice_when { |a, b| a < b }.each do |sub_array|
    sub_array.each_with_index do |element, index|
      index == 0 ? string << element.upcase : string << element
    end
  end
  
  string
end

# using sort_by method
def find_children(dancing_brigade)
  dancing_brigade.chars.sort_by { |char| [char.downcase, char] }.join
end
