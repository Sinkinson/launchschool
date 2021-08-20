# Take a look at the following code

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# what does this code print. Fix the class so there are no surprises

# current output
# - 'Fluffy'
# - 'My name is FLUFFY.'
# - 'FLUFFY'
# - 'FLUFFY'

# solution
class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

# Further exploration
# What would happen given these test cases
name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# Explain why this code works and produces the output it does

# - an object is instantiated from the Pet class and passed in the argument 42 (already assigned to the local variable name)
# - we then add one the to the local variable name
#   - this does not affect anything inside our class
# - we then call name on the object which returns 42 because we have converted it to a string in the initialize method
# - we then call puts on the object which calls the to_s method and returns the string with the name included (the string '42')
# - we then call use the getter method to retrieve the name of our object name fluffy which is still the string '42'
# - finally we call puts on the local variable name, which is 43 because we added one. When we call puts it calls to_s on the argument
#   so we actually get the string '43' back.
# - the instance variable @name and the local variable name never point to the same object
