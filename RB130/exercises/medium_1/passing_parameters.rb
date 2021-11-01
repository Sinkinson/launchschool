# Modify the method below so that the display/output of items is moved to a block, and its implementation
# is left up to the user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  puts "#{items.join(', ')}"
  puts "Nice selection of food we have gathered!"
end

# option 1
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |produce| puts produce.join('; ') }
gather(items) do |produce|
  puts "We've gathered some vegetables: #{produce[1]} and #{produce[2]}"
end

# option 2
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather
  puts "Let's start gathering food."
  yield
  puts "Nice selection of food we have gathered!"
end

gather { puts "#{items.join(', ')}" }

# Because items is in scope when we create our block we have access to it so don't actually need to pass it into the method
