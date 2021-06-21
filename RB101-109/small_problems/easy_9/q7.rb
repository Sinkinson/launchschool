# Write a method that takes a first name, a space and a last name passed as a single string argument,
# and returns a string that contains the last name, a comma, a space and the first name

def swap_name(string)
  name_arr = string.split
  firstname = name_arr[0]
  surname = name_arr[1]
  surname + ", " + firstname
end

# refactor

def swap_name(string)
  firstname = name.split[0]
  surname = name.split[1]
  "#{surname}, #{firstname}"
end

# test case
p swap_name('Joe Roberts') == 'Roberts, Joe'

# Even more concise

def swap_name(name)
  name.split(' ').reverse.join(', ')
end
