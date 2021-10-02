# Below we have 3 classes: Student, Graduate, Undergraduate. The implementaion details for the initialize method in
# Graduate and Undergraduate are missing. Fill in those missing details so that following requirements are fulfilled.

# 1. Graduate students have the option to use on-campus parking, while Undergraduate students do not.
# 2. Graduate and Undergraduate students both have a name and year associated with them.

# Note: this can be done by adding or altering no more than 5 lines of code

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate
  def initialize(name, year, parking)
  end
end

class Undergraduate
  def initialize(name, year)
  end
end

# solution

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = 'yes'
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end

# We can also delete the initialize method in the Undergraduate class altogether, as it calls super with no arguments
# and defines no additional instance variables.
