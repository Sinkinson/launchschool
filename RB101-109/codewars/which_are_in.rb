# Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the
# strings of a1 which are substrings of strings of a2.

def in_array(array1, array2)
  result = []
  array2.each do |word|
    substrings = []
    (0..word.size - 1).each do |idx1|
      (idx1..word.size - 1).each do |idx2|
        substrings << word[idx1..idx2]
      end
    end

    array1.each do |substring|
      result << substring if substrings.include?(substring)
    end
  end

  result.uniq.sort
end

a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
p in_array(a1, a2) == ["arp", "live", "strong"]

# using select and any
def in_array(array1, array2)
  array1.select do |sub_string|
    array2.any? do |word|
      word.include?(substring)
    end
  end.sort
end
