# Return the number of times the search text is found within the full text

def solution(full_text, search_text)
  substrings = []
  (0..full_text.size - 1).each do |idx1|
    (idx1..full_text.size - 1).each do |idx2|
      substrings << full_text[idx1..idx2]
    end
  end
  substrings.select { |substring| substring == search_text }.size
end

p solution('aaabbbcccc', 'bbb') == 1
p solution('aa_bb_cc_dd_bb_e', 'bb') == 2
p solution('abcdeb','b') == 2

# more concise solution using scan

def solution(full_text, search_text)
  full_text.scan(search_text).size
end
