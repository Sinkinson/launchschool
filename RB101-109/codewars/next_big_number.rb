# You have to create a method that takes a positive integer number and returns the
# next bigger number formed by the same digits

# 12 -> 21
# 513 -> 531
# 2017 -> 2071
# if no bigger number can be composed using those digits, return -1:

# 9 -> -1
# 111 -> -1
# 531 -> -1

def next_bigger_num(num)
  incremented_num = num

  loop do
    incremented_num += 1
    return incremented_num if incremented_num.to_s.chars.sort == num.to_s.chars.sort
    return - 1 if incremented_num.to_s.size > num.to_s.size
  end
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798

# LS way

def next_bigger_num(input)
  max = max_num(input)
  (input + 1..max).to_a.each do |num|
    return num if matches?(num, input)
  end
  return -1
end

def matches?(num, input)
  num.to_s.chars.sort == input.to_s.chars.sort
end

def max_num(input)
input.to_s.chars.sort.reverse.join.to_i
end
