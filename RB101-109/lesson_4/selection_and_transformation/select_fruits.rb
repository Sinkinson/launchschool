produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce_list)
  counter = 0
  fruit_hash = {}
  produce_keys = produce_list.keys

  loop do
    break if counter == produce_list.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == "Fruit"
      fruit_hash[current_key] = current_value
    end

    counter += 1  
  end

  fruit_hash
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
