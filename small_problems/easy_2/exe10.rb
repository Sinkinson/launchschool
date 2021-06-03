# What will the following code output?

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# - array 1 is a word array
# - array 2 is empty
# - we iterate through array 1 and fill all the values into array 2
# - we then iterate through array 1 again and upcase all the values
#   that start with C or S
# - when we put the values into array 2 with the each method, the each
#   method copies the references to the ojects (in this case strings)
#   in array 2 so therefore if we mutate the strings in array 1 we also
#   mutate the strings in array 2
