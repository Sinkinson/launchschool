# Write function scramble(str1, str2) that returns true if a portion of str1 characters
# can be rearranged to match str2, otherwise return false.

# For example:
# str1 is 'rkqodlw' and str2 is 'world' the output should return true
# str1 is 'cedewaraaossoqqyt' and str2 is 'codewars' should return true
# str1 is 'katas' and str2 is 'steak' should return false

# Only lowercase letters will be used. No punctuation or digits will be included

def scramble(str1, str2)
  str1.chars.each { |letter| str2.sub!(letter, '') }
  str2.empty? ? true : false
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true

# LS way

def scramble(str1, str2)
  str2.chars.each do |char|
    return false if str2.count(char) > str1.count(char)
  end
  true
end
