# Write a method that takes an array of strings and returns an array of string values
# except with the vowels (a,e,i,o,u) removed

VOWELS = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']

def remove_vowels(word_array)
  word_array.each do |word|
    word.gsub!(/(#{VOWELS})/, '' )
  end
end

# test cases
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# LS way

def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end
