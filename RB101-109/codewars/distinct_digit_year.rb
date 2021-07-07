# The year of 2013 is the first year after the old 1987 with only distinct digits.
# Now your task is to solve the following problem: given a year number, find the 
# minimum year number which is strictly larger than the given one and has only distinct digits.
# e.g. input: 1987 output: 2013

def distinct_digit_year(year)
  year_arr = ((year + 1)..9999).to_a
  year_arr.each do |year|
    return year if year.to_s.split(//).uniq.size == year.to_s.chars.size
  end
end

# Test cases
distinct_digit_year(8981)
distinct_digit_year(2229)
distinct_digit_year(2013)

# More succinct solution without having to create an array

def distinct_digit_year(year)
  year += 1
  year += 1 until year.digits.uniq  == year.digits
  year 
end
