# modify the method in q6 to exclude non-letters when determining word size
# e.g. the word it's is 3 not 4

def word_sizes(string)
  word_count_hash = Hash.new(0)
  string.split.each do |word|
    word.gsub!(/\W/, '')
    word_count_hash[word.size] += 1
  end
  word_count_hash
end

word_sizes('Four score and seven.') == { 4 => 1, 5 => 2, 3 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}

# LS way, uses delete instead of gsub

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    clean_word = word.delete('^A-Za-z') # everything that follows ^ is negated. So delete everything that isn't a letter
    counts[clean_word.size] += 1
  end
  counts
end
