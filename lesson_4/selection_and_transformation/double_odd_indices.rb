def double_odd_indices(array)
  counter = 0
  doubled_numbers = []

  loop do
    break if counter == array.size

    current_number = array[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1 
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indices(my_numbers)
p my_numbers

# See below for a version that mutates the argument

def double_odd_indices!(array)
  counter = 0

  loop do
    break if counter == array.size
    array[counter] *= 2 if counter.odd?
    counter += 1
  end

  array
end
