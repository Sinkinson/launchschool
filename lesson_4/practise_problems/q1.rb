# turn this array into a hash where the names are the keys and the values
# are the positions in the array

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flint_hash = flintstones.to_h { |string| [string, flintstones.index(string)] }

# LS way
flinstones_hash = {}
flinstones.each_with_index do |name, index|
  flinstones_hash[name] = index
end
