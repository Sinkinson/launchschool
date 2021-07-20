# Given a string of words, you need to find the highest scoring word.
# Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.
# You need to return the highest scoring word as a string.
# If two words score the same, return the word that appears earliest in the original string
# All letters will be lowercase and all inputs will be valid.

def high(string)
  alpha = ('a'..'z').zip(1..26).to_h
  total = 0
  highest = ''

  string.split.each do |word|
    numbers = []
    word.chars.each { |char| numbers << alpha[char] }
      if numbers.sum > total
        total = numbers.sum
        highest = word
      end
    end

  highest
end

p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aa b') == 'aa'
p high('b aa') == 'b'
p high('bb d') == 'bb'
p high('d bb') == 'd'
p high('aaa b') == 'aaa'
