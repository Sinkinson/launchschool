# write a method that takes a year as input and returns the century
# the return value should be a string that begins with the century number
# and ends with st, nd, rd or th as appropriate for that number
# new centuries begin with 01 e.g. 1901 - 2000: 20th century

def century(year)
    century = (year - 1) / 100 + 1
    puts "#{century}#{appender(century)} Century"
end

def appender(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  array = century.to_s.chars
  if array.last == '1'
    "st"
  elsif array.last == '2'
    "nd"
  elsif array.last == '3'
    "rd"
  else
    "th"
  end
end

# test cases
century(2000)
century(2001)
century(1965) 
century(256)
century(5)
century(10103)
century(1052)
century(1127)
century(11201)

# LS way

# def century(year)
#   century = year / 100 + 1
#   century -= 1 if year % 100 == 0
#   century.to_s + century_suffix(century)
# end

# def century_suffix(century)
#   return 'th' if [11, 12, 13].include?(century % 100)
#   last_digit = century % 10

#   case last_digit
#   when 1 then 'st'
#   when 2 then 'nd'
#   when 3 then 'rd'
#   else 'th'
#   end
# end