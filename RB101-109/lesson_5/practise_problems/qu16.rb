# a UUID is a type of identifier
# each UUID consists of 32 hexadecimal characters and is typically broken
# down into 5 sections (8-4-4-4-12) and represented as a string
# it looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
# write a method that returns one UUID when called with no parameters

HEXADECIMAL = [0,1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f']

def uuid_generator
  uuid_array = []
  while uuid_array.size < 36
    uuid_array << HEXADECIMAL.sample
    if [8, 13, 18, 23].include?(uuid_array.size)
      uuid_array << '-'
    end
  end
  p uuid_array.join
end

uuid_generator

#LS way

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

# line 50 is just making sure that a '-' is not added on the last iteration
