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

# In the make_one_year_older method we have used self. What is another way we would write this method
# so we don't have to use the self prefix?

def make_one_year_older
  @age += 1
end

# self in this case is ensuring we are referencing the setter method for age. We can also just go directly
# to the instance variable by prefixing an @ symbol

