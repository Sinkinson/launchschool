# Write a method that takes an array of integers between 0 and 19
# it should return an array of those integers sorted based on the english
# words for each number

WORD_HASH = { 0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four",
              5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine",
              10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen",
              14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen",
              18 => "eighteen", 19 => "nineteen",
}

def alphabetic_number_sort(num_array)
  word_array = []
  num_array.each do |num|
    word_array << WORD_HASH[num]
    word_array.sort!
  end
    word_array.each_with_index do |word, index|
      word_array[index] = WORD_HASH.key(word) # this uses the value to return the key. It saves the key at the given index
    end
  word_array
end

# refactor

def alphabetic_number_sort(num_array)
  word_array = num_array.map { |num| WORD_HASH[num] }.sort!
    word_array.each_with_index do |word, index|
      word_array[index] = WORD_HASH.key(word)
    end
  word_array
end

# test case
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# LS way

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end

# because all the numbers are in a sequential order we don't need to create a hash
# with key value pairs, we can use the sort_by method, this sorts the numbers array
# based off the word in the NUMBER_WORDS array. So when we provide 0 to be sorted
# it looks up the word at index 0 in NUMBER_WORDS
