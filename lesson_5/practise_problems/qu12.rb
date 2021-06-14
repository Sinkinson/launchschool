# given the following data structure and without using the Array#to_h method, write some code
# that will return a hash where the key is the first item in each sub array and the value is the second item

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected output: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

new_hash = {}
arr.each do |sub_array|
  new_hash[sub_array[0]] = sub_array[1]
end

p new_hash
