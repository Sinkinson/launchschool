# The vowel substrings in the word codewarriors are o,e,a,io. The longest of these 
# has a length of 2. Given a lowercase string that has alphabetic characters only 
# (both vowels and consonants) and no spaces, return the length of the longest vowel 
# substring. Vowels are any of aeiou.

def solve(string)
  vowel_subs = []
  (0..string.size - 1).each do |idx1|
    (idx1..string.size - 1).each do |idx2|
      if string[idx1..idx2].split(//).all? { |char| 'aeiou'.include?(char) }
        vowel_subs << string[idx1..idx2]
      end
    end
  end
  vowel_subs.max_by { |v_string| v_string.size }.size
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

# concise solution

def solve(string)
  string.scan(/[aeiou]+/).map(&:size).max
end
