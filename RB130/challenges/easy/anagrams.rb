# Write a program that takes a word and a list of possible anagrams and selects the correct sublist
# that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets",
# and "banana", the program should return a list containing "inlets". Please read the test suite
# for the exact rules of anagrams.

=begin

problem
- take a word and a list of possible anagrams
- return the words from the list that are anagrams with the original word

input: word as string
output: array of anagrams from given array

rules
- return an empty array if there are no anagrams
- can not use the same letter twice
- matches are case insensitive
- identical words are no anagrams

examples
- corn matches with cron but not Corn, because Corn is an identical word

mental model
- we first need to sort our given word
- we then iterate through the array and we sort each word. But if the word is the same before it is sorted then it is identical so we discount it
- we cannot match a substring. The lengths of the words must be exactly the same and they must have the same letters

algo
- create an anagram class that holds a single string as an instance variable
- create a match method within the class
  - the match method will first save the instance variable to a new local variable but sorted and downcased
  - we will then iterate through the array
    - downcase the word and if it matches the original unsorted word then discount it
    - otherwise see if the word downcased and sorted matches our downcased and sorted original word. If it does add it to a results array.
- return the results array once the iteration is complete

=end

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(word_array)
    word_array.select do |str|
      str.downcase != word.downcase &&
      anagram?(str, word)
    end
  end

  def anagram?(word_1, word_2)
    sorted(word_1) == sorted(word_2)
  end

  def sorted(str)
    str.downcase.chars.sort.join
  end
end

# option 2 (not ideal as match method is too long)
class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(array)
    result = []
    sorted = word.downcase.split(//).sort.join
    array.each do |str|
      next if str.downcase == word.downcase
      result << str if str.downcase.split(//).sort.join == sorted
    end
    result
  end
end
