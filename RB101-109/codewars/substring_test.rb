# Given 2 strings, your job is to find out if there is a substring that appears in both 
# strings. You will return true if you find a substring that appears in both strings, or
# false if you do not. We only care about substrings that are more than one letter long.

def substring_test(string_1, string_2)
  string_1.downcase!
  string_2.downcase!
  short_string = [string_1, string_2].sort_by(&:size).first
  
  substrings = []
  (0..short_string.size).each do |start|
    (2..short_string.size - start).each do |length|
      substrings << short_string[start, length]
    end
  end
  substrings.each do |substring|
    return true if string_1.include?(substring) && string_2.include?(substring)
  end
  false
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

# LS way

def substring_test(str1,  str2)
  str1_chars = str1.downcase.chars
  str2_chars = str2.downcase.chars

  str1_chars.each_with_index do |char1, idx1|
    str2_chars.each_with_index do |char2, idx2|
      return true if char1 == char2 && str1_chars[idx1 + 1] == str2_chars[idx2 + 1] \
      && idx1 != (str1_chars.size - 1)
    end
  end
  false
end
