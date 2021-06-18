# Write a method that takes a string as an argument and returns a new string
# that contains the original value using a staggered capitalization scheme
# in which every other letter is capitalized and the remaining characters
# are lowercase. Characters that are not letters should not be changed, but
# still count as characters when switching between upper and lowercase

def staggered_case(string)
  string.chars.each_with_index do |letter, index|
   index.even? ? letter.upcase! : letter.downcase!
  end.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# LS way

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

# this solution iterates through the string character by character
# building the result string gradually.
# Through every iteration we toggle need_upper between true and false
# that way every other character will be upcased

# could also have the caller provide a true or false value in order to change
# the order of the stagger

def staggered_case(string, starter = true)
  string.chars.each do |char|
    starter ? char.upcase! : char.downcase!
    starter = !starter
  end.join
end

p staggered_case('I Love Launch School!', false) == "i lOvE LaUnCh sChOoL!"
p staggered_case('ALL_CAPS', true) == "AlL_CaPs"
p staggered_case('ignore 77 the 444 numbers', false) == "iGnOrE 77 tHe 444 nUmBeRs"
