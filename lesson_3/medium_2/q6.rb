# how could the following code be simplified without changing its return value?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# Ruby will automatically evaluate statements so you can just simplify it to the following
def color_valid(color)
color == "blue" || color == "green"
end
