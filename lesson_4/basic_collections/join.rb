# see the outputs for array join below. How can we get the original string back with spaces

str = 'How do you get to Carnegie Hall?'
  arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
  arr.join        # => "HowdoyougettoCarnegieHall?"

# can pass a single space as an argument
puts arr.join(" ")
