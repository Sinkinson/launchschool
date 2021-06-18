# build a program that asks the user for the length and width of a room in meters
# display the area of the room in square m and square feet

def sqaure_room(length, width)
  length.to_f * width.to_f
end

def prompt(msg)
  puts ">> #{msg}"
end

prompt("Enter the length of the room in meters:")
length = gets.chomp
prompt("Enter the width of the room in meters:")
width = gets.chomp

area = sqaure_room(length, width)
sqaure_feet = area * 10.7639

prompt("The area of the room is #{area.round(2)} square meters (#{sqaure_feet.round(2)} square feet)")

# LS way

# SQMETERS_TO_SQFEET = 10.7639

# puts '==> Enter the length of the room in meters: '
# length = gets.to_f

# puts '==> Enter the width of the room in meters: '
# width = gets.to_f

# square_meters = (length * width).round(2)
# square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)

# puts "The area of the room is #{square_meters} " + \
#      "square meters (#{square_feet} square feet)."
