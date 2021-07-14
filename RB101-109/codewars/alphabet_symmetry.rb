# Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. 
# In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy 
# the positions they would occupy in the alphabet, which are positions 4 and 5.
# Given an array of words, return an array of the number of letters that occupy their positions 
# in the alphabet for each word.
# For example: ["abode","ABc","xyzD"]) = [4, 3, 1]

def solve(arr)
  results = []
  arr.each(&:downcase!)
  arr.each do |string|
    place_counter = 0
    string.split(//).each_with_index do |letter, index|
      place_counter += 1 if index + 97 == letter.ord
    end
    results << place_counter
  end
  results
end

p solve(["abode","ABc","xyzD"])
p solve(["abide","ABc","xyz"])
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])
p solve(["encode","abc","xyzD","ABmD"])

# more concise solution

def solve(strings)
  strings.map{ |s| s.downcase.each_char.zip('a'..'z').count{ |a, b| a == b } }
end

# map method is called on the array of strings
# within the block the downcase method is called on each string
# each_char is then called on the downcased string which iterates through every character.
# Every character then has the zip method called on it and is put into an array with
# the corresponding character in the argument provided to zip.
# if the first letter was 'a' then it would return ['a', 'a']
# if the second letter was 'r' then it would be return ['r', 'b']
# the zip method ultimately returns a multidimensional array with all these combinations
# the count method is then called on the array and this returns the amount of times
# each element within the subarray equal one another
