# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the make_one_year_older method we have used self. What does self refer to here?

# self here refers to the calling object. So if we instantiate an object from the Cat class and then
# call the make_one_year_older method on that object, self will reference this object. So therefore
# it will add one to the age instance variable in that object.
