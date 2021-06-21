# Write a program that prints out groups of words that are anagrams. Anagrams are words that have the exact
# same letters in them but in a different order

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# output:
#           ["demo", "dome", "mode"]
#           ["neon", "none"]
#           #(etc)

result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "------"
  p v
end

# This program iterates through each word. For each word it sorts it by turning it into an array
# first and then joining it back together. It stores this sorted string in the variable key.
# It then asks if the results hash has the current key (current word). If it doesn't it then 
# creates a value for that key with the word in an array. If it does have it then it pushes that
# word into the value array.
# It finished by printing out the values from the results hash, which is the arrays containing
# the anagrams
