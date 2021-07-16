# Write a method that takes a string as an argument and groups the number of time
# each character appears in the string as a hash sorted by the highest number of occurrences
# characters should be sorted alphabetically, for example:
# get_char_count("cba") => {1=>["a", "b", "c"]}

def create_letter_hash(string)
  count = Hash.new(0)
  letters = string.split(/\W/).map(&:downcase).join.chars
  letters.each { |char| count[char] += 1 }
  count.group_by { |_, v| v }
end

def get_char_count(string)
  result = create_letter_hash(string)
  result.each do |key, value|
    new_arr = value.map do |sub_array|
      sub_array.select.with_index { |_, index| index == 0 }
    end
    result[key] = new_arr.flatten.sort
  end
  result.sort_by { |k, v| k }.reverse.to_h
end

p get_char_count("Mississippi")
p get_char_count("Hello. Hello? HELLO!")
p get_char_count("aaa...bb...c!")
p get_char_count("abc123")
p get_char_count("aaabbbccc")

# more concise method
def get_char_count(string)
  clean_string = string.downcase.delete('^a-z0-9')
  chars = clean_string.chars.uniq.sort
  chars.group_by { |char| clean_string.count(char) }.sort.reverse.to_h
end
