# There is a message that is circulating via public media that claims a reader can easily
# read a message where the inner letters of each words is scrambled, as long as the first 
# and last letters remain the same and the word contains all the letters.
# Another example shows that it is quite difficult to read the text where all the letters 
# are reversed rather than scrambled.

# In this kata we will make a generator that generates text in a similar pattern, but instead
# of scrambled or reversed, ours will be sorted alphabetically.

# return a string where:

# the first and last characters remain in original place for each word
# characters between the first and last characters must be sorted alphabetically
# punctuation should remain at the same place as it started, for example: shan't -> sahn't

# Assumptions:

# words are seperated by single spaces
# only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
# special characters do not take the position of the non special characters, for example: -dcba -> -dbca
# for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
# ignore capitalisation

def scramble_words(words)
  result = []
  words_arr = words.split(' ')
  words_arr.each do |word|
    punctuation = []
    chars = word.chars
    chars.each_with_index { |char, index| punctuation << [char, index] if char =~ /[[:punct:]]/ }
    chars.delete_if { |char| char =~ /[[:punct:]]/ }
    chars[1..-2] = chars[1..-2].sort
    punctuation.each { |sub_arr| chars.insert(sub_arr[1], sub_arr[0])}
    result << chars.join
  end
  result.join(' ')
end

p scramble_words("faee-irrsttr,")
p scramble_words("watching,")
p scramble_words('i')
p scramble_words('')
p scramble_words('me')
p scramble_words('you')
p scramble_words('professionals')
p scramble_words('card-carrying')
p scramble_words("shan't")
p scramble_words('-dcba')
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.")
p scramble_words("the creative a, dice brobdingnagian a four four no. is creative sun.")

# option 2
def scramble_words(words)
  words.split(' ').map { |word| scramble(word) }.join(' ')
end

def scramble(word)
  chars = word.chars
  letters = chars.select { |char| letter?(char) }
  scrambled_letters = scramble_letters(letters.join).chars
  chars.map do |char|
    letter?(char) ? scrambled_letters.shift : char
  end
    .join
end

def scramble_letters(word)
  return word if word.length <= 2
  
  word[0] + word[1...-1].chars.sort.join + word[-1]
end

def letter?(char)
  char.match? /[a-z]/
end
