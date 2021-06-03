# create a tip calculator
# program should prompt for bill amount and a tip rate
# program should compute the tip and the total amount of the bill

print "What is the bill? "
bill = gets.chomp.to_f
print "What is the tip percentage? "
tip_percentage = gets.chomp.to_f

tip_amount = (bill * (tip_percentage / 100)).round(2)
total = (bill + tip_amount).round(2)

puts "The tip is $#{tip_amount}"
puts "The total is $#{total}"

# using format to display the value two decimal points
puts "%.2f" %[total]
