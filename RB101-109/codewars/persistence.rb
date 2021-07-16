# Write a function, persistence, that takes in a positive parameter num and returns its
# multiplicative persistence, which is the number of times you must multiply the digits
# in num until you reach a single digit.

def persistence(n, count=0)
  if n.to_s.size == 1
    count
  else
    persistence(n.to_s.chars.map(&:to_i).inject(:*), count + 1)
  end
end

p persistence(39)
p persistence(4)
p persistence(25)
p persistence(999)
p persistence(444)
