# Given two arrays a and b write a function comp(a, b) (orcompSame(a, b)) that checks whether the two arrays have
# the "same" elements, with the same multiplicities. "Same" means, here, that the elements in b are the elements
# in a squared, regardless of the order.

def comp(array1, array2)
  return false if array1.nil? || array2.nil?
  array1.map { |num| num * num }.sort == array2.sort
end

p comp( [121, 144, 19, 161, 19, 144, 19, 11], 
[11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19])
