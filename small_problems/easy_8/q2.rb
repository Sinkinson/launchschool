# Create a madlib program that prompts for a noun, a verb, amd adverb
# and an adjective and injects those into a story that you create

print "Enter a noun: "
noun = gets.chomp
print "Enter a verb: "
verb = gets.chomp
print "Enter an adjective: "
adjective = gets.chomp
print "Enter an adverb: "
adverb = gets.chomp

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}. That's hilarious"

# another solution using a hash

words = {noun: '', verb: '', adjective: '', adverb: ''}

words.each_key do |key|
  puts ">> #{key} please: "
  words[key] = gets.chomp
end

puts "The #{words[:noun]} likes to #{words[:verb]} "\
"#{words[:adverb]} in the #{words[:adjective]} moonlight."
