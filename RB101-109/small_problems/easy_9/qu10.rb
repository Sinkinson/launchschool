# Write a method which takes a grocery list (array) of fruits with quantities and converts
# it into an array of the correct number of each fruit

def buy_fruit(array)
  fruit_array = []
  array.each do |sub_array|
    fruit = sub_array[0]
    amount = sub_array[1] 
    amount.times { fruit_array << fruit }
  end
  fruit_array
end

# test case
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

# LS way

def buy_fruit(list)
  expanded_list = []

  list.each do |item|
    fruit, quantity = item[0], item[1]
    quantity.times { expanded_list << fruit }
  end

  expanded_list
end

# concise version

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

# where we multiply the fruit in an array by the quantity we get: ['apples', 'apples', 'apples']
# once we have done this for all sub_arrays we use flatten to create a one dimensional array
