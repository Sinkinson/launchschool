# Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"
# Your task is to process a string with "#" symbols.

# "abc#d##c"      ==>  "ac"
# "abc##d######"  ==>  ""
# "#######"       ==>  ""
# ""              ==>  ""

def clean_string(string)
  result = []

  string.chars.each do |char|
    char == '#' ? result.pop : result << char
  end

  result.join
end

p clean_string('abc#d##c')
p clean_string('abc####d##c#')

# using each with object method
def clean_string(string)
  string.chars.each_with_object([]) { |char, obj| char == '#' ? obj.pop : obj << char }.join
end
