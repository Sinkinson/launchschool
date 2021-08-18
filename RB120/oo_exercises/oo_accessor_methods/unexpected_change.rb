# Modify the following code to accept a string containing a first and last name. The name should be
# split into two instance variables in the setter method, then joined in the getter method to form a full name.

class Person
  attr_accessor :name
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name

# Expected output -> John Doe

# solution
class Person
  def name=(name)
    @first_name, @last_name = name.split(' ')
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

# solution to accept a name that contains more than one space
class Person
  def name=(name)
    full_name = name.split
    @first_name = full_name.shift
    @last_name  = full_name.join(' ')
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end
