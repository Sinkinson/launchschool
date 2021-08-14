# Using the following code, determine the lookup path used when invoking cat1.color.
# Only list the classes and modules that Ruby will check when searching for the #color method.

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

# Lookup path
# - Cat
# - Animal
# - Object
# - Kernel
# - BasicObject

# Since the answer isn't anywhere ruby searches in every class and module in the search path
