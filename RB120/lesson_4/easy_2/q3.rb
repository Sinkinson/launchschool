# How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the lookup chain for Orange?

# You can use the ancestors method to see the lookup path for a method
# The lookup chain for Orange will be as follows:

# - Orange
# - Taste
# - Object 
# - Kernel
# - BasicObject

# Its also important to remember that you cannot call ancestors on an instance of a class, it needs to be the class itself
