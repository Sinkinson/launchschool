# Consider this code:
comparator = proc { |a, b| b <=> a }

# and the Array#sort method, which expects a block argument to express how the Array will be sorted.
# If we want to use comparator to sort the Array, we have a problem: it is a proc, not a block. The following code:

array.sort(comparator)

# fails with an ArgumentError. To get around this, we can use the proc to block operator & to convert comparator to a block:

array.sort(&comparator)

# This now works as expected, and we sort the Array in reverse order.

# Did you know that you can perform a similar trick with methods? You can apply the & operator to an object that contains a
# Method; in doing so, Ruby calls Method#to_proc.

# Using this information, together with the course page linked above, fill in the missing part of the following code so we can
# convert an array of integers to base 8 (octal numbers). Use the comments for help in determining where to make your modifications,
# and make sure to review the "Approach/Algorithm" section for this exercise; it should prove useful.

def convert_to_base_8(n)
  n.method_name.method_name # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(argument).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
[8, 10, 12, 14, 16, 33].map(&a_proc)

# The expected return value of map on this number array should be:
[10, 12, 14, 16, 20, 41]

# solution
def convert_to_base_8(n)
  n.to_s(8).to_i
end

base8_proc = method(:convert_to_base_8).to_proc

[8, 10, 12, 14, 16, 33].map(&base8_proc) # => [10, 12, 14, 16, 20, 41]

# notice the convert_to_base_8 method takes a number like argument -- n
# we pass method an existing method as a symbol and it gets wrapped up as a method object.
# this is how the implementation ends up looking
def convert_to_base_8(n)
  n.to_s(8).to_i
end

# ->

Proc.new { |n| n.to_s(8).to_i }
#when we use & to convert our Proc to a block, it expands out to...

# ->
[8, 10, 12, 14, 16, 33].map { |n| n.to_s(8).to_i }