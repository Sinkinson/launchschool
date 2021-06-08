# What will the following return?

str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

str[-6] # => nil
arr[-6] # => nil

# these negative indices are out of bounds
# this can be confirmed by invoking fetch

arr.fetch(-6) # => IndexError: index -6 outside of array bounds: -5...5
              #        from (irb):2:in `fetch'
              #        from (irb):2
              #        from /usr/bin/irb:11:in `<main>'
              