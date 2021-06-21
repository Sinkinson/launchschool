# Write a method that determines the mean of three scores passed to it
# and returns the letter associated with that grade.
# Test values are all between 0 and 100. There is no need to check for negative
# values or values greater than 100

def get_grade(s1, s2, s3)
result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

# What if you wanted a grade for over 100?
# You could make the range limitless

def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3
  
    case result
    when 101... then 'A+'
    when 90..100 then 'A'
    when 80..89  then 'B'
    when 70..79  then 'C'
    when 60..69  then 'D'
    else              'F'
    end
  end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# The comparison used by the case statement returns true if the range includes the other object
# it's like calling range.include?(other_object)
