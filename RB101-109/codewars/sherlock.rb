# Sherlock has to find suspects on his latest case. He will use your method, dear Watson. 
# Suspect in this case is a person which has something not allowed in his/her pockets.
# Allowed items are defined by array of numbers. Pockets contents are defined by map
# entries where key is a person and value is one or few things represented by an array
# of numbers (can be nil or empty array if empty), example:

# pockets = { 
#   bob: [1],
#   tom: [2, 5],
#   jane: [7]
# }

# Write method which helps Sherlock to find suspects. If no suspect is found or there
# are no pockets (pockets == nil), the method should return nil.

def find_suspects(pockets, allowed_items)
  suspects = []
  
  pockets.each do |name, pocket|
    next if pocket == nil || pocket.empty?
    pocket.each do |possession|
      next if allowed_items.include?(possession)
      suspects << name unless suspects.include?(name)
    end
  end

  suspects.empty? ? nil : result
end

pockets = { julia: nil, meg: [] }
find_suspects(pockets, [1, 6])

# pockets = { tom: [2], bob: [2], julia: [3], meg: [3] }
# find_suspects(pockets, [2, 3])

# can also take one array from the other to achieve the same result
def find_suspects(pockets, allowed_items)
  suspects = []
  pockets.each do |person, items|
    suspects << person unless (Array(items) - allowed_items).empty?
  end
  suspects.empty? ? nil : suspects
end

# this subtracts one array from the other, if anything is left then there is an item that isn't allowed
# so the name is put into the array.
