# Josh wants to print an array of numeric strings in reverse numerical order. However,
# the output is wrong. Without removing any code, help Josh get the expected output.

arr = ["9", "8", "7", "10", "11"]
p arr.sort do |x, y|
    y.to_i <=> x.to_i
  end

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 

# solution 1
p(
  arr.sort do |x, y|
    y.to_i <=> x.to_i
  end
)

# solution 2
p arr.sort { |x, y| y.to_i <=> x.to_i }

# The reason why the first section of code does not print what you'd think is because p and arr.sort bind
# more tightly. Its like writing (p arr.sort)
# so we either need to use curly braces or brackets to ensure the block is not ignored
