# The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant
# influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.
# Write a program that deciphers and prints each of these names.

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

ALPHABET = ('a'..'z').to_a

def rot13(array)
  array.each do |encrypted_name|
    puts decrypt(encrypted_name)
  end
end

def decrypt(name)
  result = ''
  name.downcase.each_char do |char|
    next if not_letter?(result, char)
    idx = ALPHABET.index(char) + 13
    idx -= 26 if idx > 25
    result << ALPHABET[idx]
  end
  result.split.map(&:capitalize).join(' ')
end

def not_letter?(name, char)
  if char !~ /[A-Za-z]/
    name << char
    return true
  end
  false
end

rot13(ENCRYPTED_PIONEERS)

# option 2
ALPHABET = (1..26).zip("a".."z").to_h

def rot13(array)
  array.each do |encrypted_name|
    puts decrypt(encrypted_name)
  end
end

def decrypt(name)
  decrypted_name = ''
  name.each_char do |char|
    next if not_letter?(decrypted_name, char)
    current_position = ALPHABET.key(char.downcase)
    next_position = current_position + 13
    next_position -= 26 if next_position > 26
    decrypted_name <<  ALPHABET.fetch(next_position)
  end
  decrypted_name.split.map(&:capitalize).join(' ')
end

def not_letter?(name, char)
  if char !~ /[A-Za-z]/
    name << char
    return true
  end
  false
end

# option 3
def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end

ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end

# Here the reduce method called after each_char enables us to provide a result which is initially set to a empty string.
# The result is assigned to the return value of the block on each iteration and then used again within the next iteration.
# Ultimately the reduce method returns the result once all characters have been iterated through.
# The String#ord method is used to convert the character to a numeric value
# The String#chr method is used to convert a numeric value back to its character in the ASCII table
