# Given: an array containing hashes of names
# Return: a string formatted as a list of names separated by commas except for the last two names, which should be separated by an ampersand.
# Example:
# list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
# returns 'Bart, Lisa & Maggie'
# list([ {name: 'Bart'}, {name: 'Lisa'} ])
# returns 'Bart & Lisa'
# list([ {name: 'Bart'} ])
# returns 'Bart'
# list([])
# returns ''

def list(names)
  just_names = []
  return '' if names.empty?
  names.each { |hash| just_names << hash[:name] }
  return just_names.join if just_names.size == 1
  return just_names.join(' & ') if just_names.size == 2

  last_name = ' & ' << just_names.pop
  just_names.join(', ') + last_name
end

p list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
p list([{name: 'Bart'},{name: 'Lisa'}])
p list([{name: 'Bart'}])

# option 2
def list names
  names = names.map { |hash| hash[:name] }
  last_name = names.pop
  return last_name.to_s if names.empty?
  "#{names.join(', ')} & #{last_name}"
end
