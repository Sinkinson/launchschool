# Your goal is to write the group_and_count method, which should receive an array as unique parameter and return a hash.
# Empty or nil input must return nil insteadof a hash. This hash returned must contain as keys the unique values of the
# array, and as values the counting of each value.

def group_and_count(array)
  
  groups_hash = Hash.new(0)
  array.each { |num| groups_hash[num] += 1 }
  groups_hash
end

p group_and_count([0,1,1,0])

# option 2 (using group_by method)
def group_and_count(array)
  return nil if array.nil? || array.empty?
  groups = array.group_by { |n| n }
  groups.each { |key, value| groups[key] = value.size }
end

# option 3 (using each_with_object)
def group_and_count(array)
  return nil if array.nil? || array.empty?
  array.each_with_object(Hash.new(0)) { |k, h| h[k] += 1 }
end
