# Create a method that takes two arguments, and array and a hash. The array will contain
# 2 or more elements that, when combined with the adjoining spaces, will produce a persons
# name. The hash will contain two keys (:title and :occupation), and the appropriate values
# Your method should return a greeting that uses the person's full name and mentions the 
# persons title and occupation

def greetings(array, hash)
  name = array.join(' ')
  "Hello, #{name}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# further exploration

def greetings(name, status)
  name = array.join(' ')
  job = status.values.join(' ')
  "Hello, #{name}! Nice to have a #{job} around."
end
