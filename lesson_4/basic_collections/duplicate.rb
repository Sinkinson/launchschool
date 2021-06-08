# duplicate key
hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }

# keys must be unique otherwise they will be overwritten as can be seen above
# => { 'fruit' => 'pear', 'vegetable' => 'carrot' }

# duplicate value
hsh = { 'apple' => 'fruit', 'carrot' => 'vegetable', 'pear' => 'fruit' }

# values on the other hand can be duplicated without any issues
# => { 'apple' => 'fruit', 'carrot' => 'vegetable', 'pear' => 'fruit' }
