# The input is a string of digits. Cut the string into chunks (a chunk here is a substring of the initial string)
# of size sz (ignore the last chunk if its size is less than sz). If a chunk represents an integer such as the sum of
# the cubes of its digits is divisible by 2, reverse that chunk; otherwise rotate it to the left by one position.
# Put together these modified chunks and return the result as a string.

# If:
# - sz is <= 0 or if str is empty return ""
# - sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".

def revrot(str, sz)
  result = ''
  return '' if sz == 0 || str.size < sz

  str.chars.map(&:to_i).each_slice(sz) do |arr|
    next if arr.size < sz  
    arr.sum % 2 == 0 ? result << arr.reverse.join : result << arr.rotate(1).join
  end

  result
end

p revrot("123456987654", 6) == "234561876549"
p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("733049910872815764", 5) == "330479108928157"
