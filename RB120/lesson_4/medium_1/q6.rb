# If we have these two methods in the Computer class:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# and:

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

# There is no difference in the result, only the way in which the task is accomplished.

# Difference between the create_template methods
# - The create_template method in the first example goes directly to the template instance variable
#   in order to set it.
# - The create_template method in the second example instead goes to the setter method created by the
#   attr_accessor method

# Difference between the show_template methods
# - In the first example we call the template getter created by the attr_accessor method.
# - In the second example we are calling the template getter again but with a explicit self, that isn't
#   actually required.

# Calling self.template is the same as calling the template method
# Calling self.template = is the same as calling the template= method

# The reason we have to use self when using a setter method is to differentiate between a setter and
# initialising a local vairable. If we to do this: template =
# then we would just be initialising a local variable and not actually calling the setter

# As a general rule, avoid using self where not required
