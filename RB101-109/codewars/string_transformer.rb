# Given a string, return a new string that has transformed based on the input:

# Change case of every character, ie. lower case to upper case, upper case to lower case.
# Reverse the order of words from the input.
# Note: You will have to handle multiple spaces, and leading/trailing spaces.

def string_transformer(str)
  str.swapcase.split(/(\s+)/).reverse.join
end

p string_transformer('Example string')

# can also use /\b/ as the regex to split on word boundaries
