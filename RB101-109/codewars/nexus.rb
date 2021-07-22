# Complete the method that takes a hash/object/directory/association list of users, and find
# the nexus: the user whose rank is the closest is equal to his honor. Return the rank of
# this user. For each user, the key is the rank and the value is the honor. If nobody has an
# exact rank/honor match, return the rank of the user who comes closest. If there are several
# users who come closest, return the one with the lowest rank (numeric value). The hash will
# not necessarily contain consecutive rank numbers; return the best match from the ranks provided.

def nexus(users)
  lowest_key = 5000
  user = 5000
  groups = users.group_by { |k, v| (k - v).abs }
  groups.each { |k, v| lowest_key = k if k < lowest_key }
  min_group = groups[lowest_key]
  min_group.each { |arr| user = arr[0] if arr[0] < user }
  user
end

users = {1 => 3, 3 => 3, 5 => 1}
p nexus(users) == 3

# option 2 (sort the array prior to ensure lowest rank is got if two users have same difference)
def nexus users
  users.sort.min_by { |k, v| (k - v).abs }[0]
end

# option 3 (use min_by and include the rank)
def nexus(users)
  users.min_by{ |rank, honor| [(rank - honor).abs, rank] }[0]
end
