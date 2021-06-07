if 42.between?(10, 100)
  puts "it's between"
end

# easier to use the cover method on a range

(10..100).cover?(42)
