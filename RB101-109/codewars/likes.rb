# You probably know the "like" system from Facebook and other pages. People can "like" blog posts, pictures
# or other items. We want to create the text that should be displayed next to such an item. Implement a function
# likes :: [String] -> String, which must take in input array, containing the names of people who like an item.
# It must return the display text as shown in the examples:

# likes [] -- must be "no one likes this"
# likes ["Peter"] -- must be "Peter likes this"
# likes ["Jacob", "Alex"] -- must be "Jacob and Alex like this"
# likes ["Max", "John", "Mark"] -- must be "Max, John and Mark like this"
# likes ["Alex", "Jacob", "Mark", "Max"] -- must be "Alex, Jacob and 2 others like this"

def likes(names)
  return "no one likes this" if names.empty?
  return "#{names.join} likes this" if names.size == 1
  if names.size == 2 || names.size == 3
    last_name = names.pop
    "#{names.join(', ')} and #{last_name} like this"
  else
    "#{names[0..1].join(', ')} and #{names[2..-1].size} others like this"
  end
end

p likes([]) # == 'no one likes this'
p likes(['Peter']) # == 'Peter likes this'
p likes(['Jacob', 'Alex']) # == 'Jacob and Alex like this'
p likes(['Max', 'John', 'Mark']) # == 'Max, John and Mark like this'
p likes(['Alex', 'Jacob', 'Mark', 'Max']) # == 'Alex, Jacob and 2 others like this'

# using case statement
def likes(names)
  case names.size
  when 0 
    "no one likes this"
  when 1 
    "#{names[0]} likes this"
  when 2
    "#{names[0]} and #{names[1]} like this"
  when 3
    "#{names[0]}, #{names[1]} and #{names[2]} like this"
  else
    "#{names[0]}, #{names[1]} and #{names.size - 2} others like this"
  end
end
