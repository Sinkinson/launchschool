# What is wrong with the following code? What fix(es) would you make?
class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    self.expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander

# solution
# Here the to_s method tries to call the private expand method with using self. Private methods can never be called with an
# explicit caller (unless you are running ruby 2.7 +). Therefore, it must be called with the syntax expand(3)
