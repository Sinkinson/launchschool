# For a given nonempty string s find a minimum substring t and the maximum number k, 
# such that the entire string s is equal to t repeated k times. The input string consists 
# of lowercase latin letters. Your function should return a tuple (in Python) (t, k) or 
# an array (in Ruby and JavaScript) [t, k]

def find_smallest_substring(string)
  substrings = []
  results = []

  (0..string.size - 1).each do |idx1|
    (idx1..string.size - 1).each do |idx2|
      substrings << string[idx1..idx2]
    end
  end

  substrings.each do |substring|
    multiplier = string.size / substring.size
    if substring * multiplier == string
      results << [substring, multiplier]
    end
  end

  results.max_by { |sub_array| sub_array[1] }
end

p find_smallest_substring("ababab")
p find_smallest_substring("abcde")
