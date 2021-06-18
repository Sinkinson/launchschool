# build a program that displays when the user will retire
# and also how many years she has to work till retirement

print "What is your age? "
age = gets.chomp.to_i
print "At what age would you like to retire? "
retirement_age = gets.chomp.to_i

current_year = Time.new.year
years_to_retirement = retirement_age - age
retirement_year = 2021 + years_to_retirement

puts "It's #{current_year}. You will retire in the year #{retirement_year}"
puts "You have #{years_to_retirement} years to go"
