# build a program that randomly generates and prints a persons age.
# generate a random number between 20 and 200

print "What is your name: "
name = gets.chomp
default_answer = "Teddy"
if name.empty?
  name = default_answer
end

puts "#{name} is #{rand(20..200)} years old"

# could also save the rand value to a variable and then put that in the string
