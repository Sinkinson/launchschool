# Write a program that manages robot factory settings.

# When robots come off the factory floor, they have no name. The first time you boot them up,
# a random name is generated, such as RX837 or BC811.

# Every once in a while, we need to reset a robot to its factory settings, which means that
# their name gets wiped. The next time you ask, it will respond with a new random name.

# The names must be random; they should not follow a predictable sequence. Random names means
# there is a risk of collisions. Your solution should not allow the use of the same name twice
# when avoidable.

class Robot
  @@old_names = []
  attr_reader :name

  def initialize
    @name = name_generator
    @@old_names << name
  end

  def name_generator
    random_name = ''
    loop do
      2.times { random_name += ('A'..'Z').to_a.sample }
      3.times { random_name += rand(9).to_s }
      break unless @@old_names.include?(random_name)
      random_name.clear
    end
    random_name
  end

  def reset
    @@old_names.delete(@name)
    @name = name_generator
  end
end

# option 2
class Robot
  @@names = []

  def name
    return @name if @name
    @name = generate_name while @@names.include?(@name) || @name.nil?
    @@names << @name
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    name = ''
    2.times { name << rand(65..90).chr }
    3.times { name << rand(0..9).to_s }
    name
  end
end
