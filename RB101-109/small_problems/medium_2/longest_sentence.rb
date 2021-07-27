# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words.
# Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces
# or sentence-ending characters should be treated as a word.You should also print the number of words in the longest sentence.

def longest_sentence(text)
  word_amount = 0
  longest_s = ''

  sentences = text.split(/[.!?]/)
  sentences.each do |sentence|
    words = sentence.split
    if words.count > word_amount
      word_amount = words.count
      longest_s = sentence
    end
  end
  "The longest sentence is #{word_amount} words long and the sentence is: #{longest_s}"
end

text = File.read('frankenstein.txt')

p longest_sentence(text)

# LS way
def longest_sentence(text)
  text = File.read('frankenstein.txt')
  sentences = text.split(/\.|\?|!/)
  largest_sentence = sentences.max_by { |sentence| sentence.split.size }
  largest_sentence = largest_sentence.strip
  number_of_words = largest_sentence.split.size

  puts "#{largest_sentence}"
  puts "Containing #{number_of_words} words"
end

# Further exploration
def longest_sentence(text)
  text = File.read('frankenstein.txt')
  sentences = text.split(/(?<=[?.!])\s*/)
  largest_sentence = sentences.max_by { |sentence| sentence.split.size }
  largest_sentence = largest_sentence.strip
  number_of_words = largest_sentence.split.size

  puts "#{largest_sentence}"
  puts "Containing #{number_of_words} words"
end

# add a positive look behing to include the punctutation within the string
# the \s* ensures there is no white space included at the start of the next space
