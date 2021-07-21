# Sort the given array of strings in alphabetical order, case insensitive. For example:
# ["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"]
# ["C", "d", "a", "B"])              -->  ["a", "B", "C", "d"]

def sortme(strings)
  strings.sort { |a, b| a.downcase <=> b.downcase }
end

p sortme(["Hello", "there", "I'm", "fine"])
p sortme(["C", "d", "a", "B"])
p sortme(["CodeWars"])

# using sort_by method
def sortme(strings)
  strings.sort_by(&:downcase)
end
