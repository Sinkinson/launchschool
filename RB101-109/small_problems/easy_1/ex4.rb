# write a method that counts the number of occurences of each element
# in a given array.
# the words in the array are case sensitive.
# once counted print each element alongside the number of occurences

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(arr)
  counter = Hash.new(0)
  arr.each { |vehicle| counter[vehicle] += 1 }
  counter.each do |k,v|
    puts "#{k} => #{v}"
  end
end

count_occurrences(vehicles)

# expected output 

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

=begin

To solve problem of SUV being uppercase:

def count_occurrences(arr)
  counter = Hash.new(0)
  arr.each do |vehicle| 
    vehicle.downcase!
    counter[vehicle] += 1
  end 
  counter.each do |k,v|
    puts "#{k} => #{v}"
end

=end