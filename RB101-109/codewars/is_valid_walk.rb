# You live in the city of Cartesia where all roads are laid out in a perfect grid. 
# You arrived ten minutes too early to an appointment, so you decided to take the 
# opportunity to go for a short walk. The city provides its citizens with a Walk 
# Generating App on their phones -- everytime you press the button it sends you an
# array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']).
# You always walk only a single block for each letter (direction) and you know it 
# takes you one minute to traverse one city block, so create a function that will
# return true if the walk the app gives you will take you exactly ten minutes
# (you don't want to be early or late!) and will, of course, return you to your
# starting point. Return false otherwise.

def is_valid_walk(walk)
  route = Hash.new(0)
  walk.each { |direction| route[direction] += 1 }
  (route['n'] == route['s'] && route['w'] == route['e']) && walk.size == 10
end

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false

# using count method
def is_valid_walk(walk)
  walk.count('n') == walk.count('s') and
  walk.count('w') == walk.count('e') and
  walk.count == 10
end
