# return an array containing the colours of the fruits and the sizes of vegetables
# the sizes should be uppercase and the colours should be capitalized

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# output => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

arr = hsh.map do |_, details|
  if details[:type] == 'fruit' 
    details[:colors].map(&:capitalize)
  else
    details[:size].upcase
  end
end

p arr

# refactored version

arr = hsh.map do |item, details|
  details[:type] == 'fruit' ? details[:colors].map(&:capitalize) \
  : details[:size].upcase
end
