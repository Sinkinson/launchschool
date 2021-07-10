# Given an array of strings made only from lowercase letters, return an array of all
# characters that show up in all strings within the given array (including duplicates).
# For example, if a character occurs 3 times in all strings but not 4 times, you need to
# include that character three times in the final answer.

def common_chars(array)
  chars = array.shift.chars

  chars.select do |char|
    array.all? {|word| word.sub!("#{char}", "") }
  end
end

# select looks at the truthiness of the blocks return value. If the block returns true the current element is selected
# The all? method is within the block. The all? method iterates through the array and checks if the each element 
# in the array meets the criteria provided in the block.
# The all? block iterates through both words in the muated array. If the word can have the current character subbed then it
# will return a string. If it can't, nil will be returned and the block will return false. This therefore means the element
# will not be selected. The mutating sub! has also been used to handle the multiple character scenario.

# If we take the first example:
# We iterate through the word array ["b", "e", "l", "l", "a"]
# The first character is "b". So we first check if "b" can be subbed in the string 'label', it can so it returns
# 'lael'. We then check if "b" can be subbed in the string 'roller', which it can't so nil is returned. This therefore
# means all? returns false. This is then evaluated by select, because select is concerned with the truthiness of the blocks
# return value it does not select the element for that current iteration.

# Test cases
p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []
