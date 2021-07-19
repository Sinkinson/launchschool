# Complete the function scramble(str1, str2) that returns true if a portion of str1
# characters can be rearranged to match str2, otherwise returns false.

def scramble(s1, s2)
  s1.chars.each { |char| s2.sub!(char, '') }
  s2.empty?
end

p scramble('rkqodlw', 'world')
p scramble('cedewaraaossoqqyt', 'codewars')
p scramble('katas', 'steak')

# option 2
def scramble(s1,s2)
  s2.chars.uniq.all? { |char| s2.count(char) <= s1.count(char) }
end
