# leap years occur in every year that is evenly divisible by 4
# unless the year is also divisible by 100
# Then it is not a leap year unless the year is evenly divisible by 400
# assume this rule is good for any year greater than 0
# write a method that takes any year greater than 0 as input and returns
# true if the year is a leap year, or false if it is not a leap year

def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

p leap_year?(2016)
p leap_year?(2015) 
p leap_year?(2100) 
p leap_year?(2400)
p leap_year?(240000)
p leap_year?(240001) 
p leap_year?(2000)
p leap_year?(1900) 
p leap_year?(1752)
p leap_year?(1700) 
p leap_year?(1)
p leap_year?(100) 
p leap_year?(400)

# More concise solutions

# option 1
# def leap_year?(year)
#   (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
# end

# option 2
# def leap_year?(year)
#   return true if (year % 4 == 0) && !(year % 100 == 0)
#   return true if (year % 100 == 0) && (year % 400 == 0)
#   false
# end
