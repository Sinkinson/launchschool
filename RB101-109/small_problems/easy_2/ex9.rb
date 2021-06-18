# looking at variables as pointers and pass by reference vs pass by value

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# => 'Alice'
#    'Bob'

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# => 'BOB'
#    'BOB'
