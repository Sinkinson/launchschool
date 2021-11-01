# For this exercise, we'll be learning and practicing our knowledge of the arity of lambdas, procs, and implicit blocks.
# Two groups of code also deal with the definition of a Proc and a Lambda, and the differences between the two. Run each
# group of code below: For your answer to this exercise, write down your observations for each group of code. After
# writing out those observations, write one final analysis that explains the differences between procs, blocks, and lambdas.

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# - procs are objects are therefore are instantiated from a class
# - a new proc can be instantiated through the Proc.new method call
# - we can see this when we in the first output as we get a Proc object back
# - When we use #call to execute the proc we see that we don't get an error if we don't pass an argument in
#   this is because Procs have lenient arity. If nothing is passed to a local block variable it is assigned to nil.

# # Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# - lambda's are Proc objects that have strict arity, so they enfore the number of arguments taken
# - This is why when we call my_lambda.call we raise an ArgumentError
# - We can instantiate a new lamda in two ways:
#   - lambda
#   - ->
# - A lambda defined with -> is called a lambda literal
# - We cannot create a lamda using lambda.new

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# - methods have strict arity, so therefore enforce the number of arguments taken
# - When we use the yield method within a method we must supply a block, otherwise we raise a LocalJumpError.
# - This also demonstrates that blocks have lenient arity. As we do not pass an argument to the block when we
#   invoke it through the yield method. The block local variable is therefore assigned to nil.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# If we pass too few arguments to a block, then the remaining local block variables are assigned to nil
# Blocks will throw an error if a variable is referenced that doesn't exist in the blocks scope.

# Summary
# Lambda's are types of Procs with strict arity. An implicit block is a chunk of code, a type of closure and
# is not an object.
# Block's and Proc's have lenient arity so do not enforce the number of arguments taken.
# Method's and Lambda's have strict arity so do enforce the number of arguments taken.
