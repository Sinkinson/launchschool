# You are given a method named spin_me that takes a string as an argument
# and returns a string that contains the same words, but with each word's
# characters reversed.
# Given the methods implementation, will the returned character be the same
# object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# With there being a mutating method and the fact we called each which
# returns whatever it was called on you may initially think that we 
# would be returned the same object.

# as soon as we call split on the string we have a new object by
# converting the string into an array. It isn't possible to get back
# to the original object again. Then once we have reversed the words 
# in the array, which is mutating so the array looks like this: ['olleh', 'dlrow'],
# and joined them back together we get a completely new string

# if we were to pass in an array and mutate it the objects would be the same
def spin_me(arr)
  arr.each do |word|
    word.reverse!
  end
end

arr = ['hello', 'world']
puts arr.object_id # 47264354160220
puts spin_me(arr).object_id # 47264354160220
