# You will be given a number and you will need to return it as a string in Expanded Form. For example:

# expanded_form(12); # Should return '10 + 2'
# expanded_form(42); # Should return '40 + 2'
# expanded_form(70304); # Should return '70000 + 300 + 4'

# All numbers will be whole numbers greater than 0.

def expanded_form(num)
  a = 1
  expanded_string = []

  (1..num.to_s.size).each do |count|
    new_num = num.to_s[-count].to_i * a
    expanded_string.prepend(new_num.to_s) if new_num.to_s != '0'
    a *= 10
  end
  
  expanded_string.join(' + ')
end

p expanded_form(12)
p expanded_form(42)
p expanded_form(70304)

# concise but method heavy option
def expanded_form(num)
  num.to_s
  .chars
  .reverse
  .map.with_index { |digit, idx| digit.to_i * 10**idx }
  .reject(&:zero?)
  .reverse
  .join(' + ')
end
