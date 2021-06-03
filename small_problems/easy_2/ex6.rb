# print all odd numbers from 1 to 99
# each number should be on a seperate line

# option 1
for i in 1..99
  puts i if i.odd?
end

# option 2
1.upto(99) { |i| puts i if i.odd? }

# option 3
new_arr = (1..99).to_a.select do |i|
  i % 2 != 0
end
puts new_arr

# option 4
value = 1
while value <= 99
  puts value
  value += 2
end
