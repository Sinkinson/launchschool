def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do 
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]

# how can we change the code above if we want to mutate the caller

def double_numbers!(numbers)
  doubled_numbers = []
  counter = 0

  loop do 
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2

    counter += 1
  end

  numbers
end

# could also keep the code the same and just replace the 
# second to last line with: numbers.replace(doubled_numbers)
# we could also just shorten lines 29 and 30 to the following:
# numbers[counter] *= 2
