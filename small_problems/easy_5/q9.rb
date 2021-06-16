# Write a method that takes a string argument and returns a new string that contains
# the value of the original string with all the consecutive duplicate characters collapsed
# into a single chracter. You may not use the squeeze method

def crunch(string)
  new_array = []
  letter_arr = string.split(//)
  letter_arr.each do |letter|
    new_array << letter unless letter == new_array.last
  end
  new_array.join
end

# test cases
crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
crunch('4444abcabccba') #== '4abcabcba' is 13 chars but we run until 12 chars
crunch('ggggggggggggggg') #== 'g'
crunch('a') #== 'a'
crunch('') #== ''

# LS way

def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

# we need to go through each character in the string and check for consecutive duplicates
# plan is to build the return value character by character in the crunch_text string
# we use index to track our position in text
# on each iteration we check whether the current indexed value is equal to the next character in the text
# if the characters are the same we advance the index to the next character
# otherwise we append the current character and increment the index
# line 26: we set it to text.length - 1 so that we can have the index set to zero and have the last character
# in the string be the last iteration
