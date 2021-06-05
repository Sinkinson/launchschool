#  julian calendar was used before 1752
#  in the julian calendar any year that is evenly divisible by 4 is a leap year
#  write a method to handle years before and after 1752

def leap_year?(year)
  if year < 1752
    year % 4 == 0
  elsif year >= 1752
    (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true