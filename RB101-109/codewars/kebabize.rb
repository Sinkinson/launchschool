# Modify the kebabize function so that it converts a camel case string into a kebab case.

def kebabize(str)
  string_arr = str.chars
  kebab_string = ''
  string_arr.each_with_index do |char, index|
    kebab_string << char if ('a'..'z').include?(char)
    next if char =~ /[^a-zA-Z]/ 
    if ('A'..'Z').to_a.include?(char)
      kebab_string << '-' unless kebab_string.empty?
      kebab_string << char.downcase
    end
  end
  kebab_string
end

# Test cases
p kebabize('camelsHaveThreeHumps') #== "camels-have-three-humps"
p kebabize('camelsHave3Humps') #== "camels-have-humps"

# using regex
def kebabize(str)
  str.gsub(/([0-9])/, '').split(/(?=[A-Z])/).join('-').downcase
end
