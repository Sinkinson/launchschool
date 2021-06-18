# without modifying the original array, use the map method to return a new array
# identical in the structure but where the value of each integer is incremented by 1

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr_2 = arr.map do |hash|
  incremented_hash = {}
  hash.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

p arr
p arr_2
