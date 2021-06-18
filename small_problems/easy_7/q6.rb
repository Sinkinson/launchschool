# Modify the method from the previous exercise so it ignores non-alphabetic
# characters when determining whether it should uppercase or lowercase
# each letter. The non-alphabetic characters should still be included in the
# return value. They just don't count when toggling the desired case


def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[^a-zA-Z]/
      result += char
      next
    end
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# LS way

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-z]/i
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
    end
  end
  result
end

# The /i flag means ignore case, so it is saying if the character is a letter
# then go through this sequence to either upcase or downcase, else just add 
# the character to the result

# adapt this method so that it can skip over non-alphabetic characters and the caller can choose whether to
# do this or not

def staggered_case(string, count_non_alpha = false)
  counter = -1
  string.chars.map do |char|
    counter += 1 if ('A'..'z').include?(char) || count_non_alpha
    counter.even? ? char.upcase : char.downcase
  end.join
end

# This method iterates the counter if the character is in the alphabet
# or the argument has been set to true
