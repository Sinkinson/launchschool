# what do you expect to happen when the greeting variable 
# is referenced in the last line of the code below

if false
  greeting = "hello world"
end

greeting

# greeting is nil here. An "undefined method or local variable"
# exception will be thrown. When you initialize a local variable
# within an if block, even if that if block doesn't get executed,
# the local variable is initialized to nil