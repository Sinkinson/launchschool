a = 'hi'
english_greetings = ['hello', a, 'good morning'] # => ['hello', 'hi', 'good morning']

greetings = {
  french: ['bonjour', 'salut', 'allo'],
  english: english_greetings,
  italian: ['buongiorno', 'buonasera', 'ciao']
}

greetings[:english][1] = 'hey'
# changed an array so a is still 'hi', but the value at index 1 is now 'hey'

greetings.each do |language, greeting_list|
  greeting_list.each { |greeting| greeting.upcase! }
end
# destrutive method so both the original array and hash will be affected

puts a # => 'hi'
puts english_greetings[1] # 'HEY'
puts greetings[:english][1] # 'HEY'
