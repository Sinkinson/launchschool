# what does shift do in the following code?

hash = { a: 'ant', b: 'bear' }
hash.shift

# when shift is used on a hash it destructively removes and returns the 
# first key-value pair. It returns the key-value pair in an array
# => [:a, 'ant']
