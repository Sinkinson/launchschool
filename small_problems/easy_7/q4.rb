# Write a method that takes a string as an argument and returns a new string in which
# every uppercase leteer is replaced by its lowercase version, and every lowercase
# letter by its uppercase version. All other characters should be unchanged
# You cannot use the swapcase method

def swapcase(string)
  swapped = string.chars.map do |letter|
    if letter =~ /[a-z]/
      letter.upcase
    elsif letter =~ /[A-Z]/
      letter.downcase
    else
      letter
    end
  end
  swapped.join
end

# test cases
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
