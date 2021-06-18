# Print all even numbers from 1 to 99, each number on a seperate line

# option 1
for i in 1..99
  puts i if i.even?
end

# option 2
i = 0
while i <= 99
  puts i += 2
end
