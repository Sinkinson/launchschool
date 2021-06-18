# write a program that will captialise the start of every word in a string

words = "the flintstones rock"

words_arr = words.split(" ")
words_arr.each do |word|
  word.capitalize!
end
puts words_arr.join(" ")

# refactored version

p words.split.map(&:capitalize).join(" ")

# used map here with not mutating capitalize so the original was unchanged
