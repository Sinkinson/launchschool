# Given a string that consists of some words (all lowercased) and an assortment 
# of non-alphabetic characters, write a method that returns that string with all 
# of the non-alphabetic characters replaced by spaces
# if one or more alphabetic characters appears in a row you should only have one space
# in the result. The result should never have consecutive spaces

def cleanup(string)
  string.gsub(/\W/, ' ').squeeze(' ')
end

# test case
cleanup("---what's my +*& line?") == ' what s my line '

# LS way (without using gsub or squeeze)

ALPHABET = ('a'..'z').to_a # creates array of lowercase alphabet

def cleanup(text)
  clean_chars = [] # initialise empty array

  text.chars.each do |char| # break text into array of letters and iterate through each letter
    if ALPHABET.include?(char) # ask if the letter is included in the alphabet
      clean_chars << char # if it is in the lower case alphabet add it to the clean_chars array
    else
      clean_chars << ' ' unless clean_chars.last == ' ' # if not in the alphabet put a space in it's place unless the last element in the array is a space
    end
  end

  clean_chars.join
end
