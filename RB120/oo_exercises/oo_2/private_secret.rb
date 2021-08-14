# Using the following code, add a method named share_secret that prints the value of @secret when invoked.

class Person
  attr_writer :secret

  def share_secret
    puts secret
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret

# Sometimes when instance methods don't need to be access outside a class it is best to make them private,
# which means they can only be invoked from within the class.
