# Pete likes to bake some cakes. He has some recipes and ingredients. Unfortunately he is not
# good in maths. Can you help him to find out, how many cakes he could bake considering his recipes?

# Write a function cakes(), which takes the recipe (object) and the available ingredients (also an object)
# and returns the maximum number of cakes Pete can bake (integer). For simplicity there are no units for
# the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). Ingredients that are not present
# in the objects, can be considered as 0.

def cakes(recipe, available)
  recipe.map { |key, value| available[key].to_i / value }.min
end

# the to_i method is used to handle the cases where the key does not exist in the available hash so nil is returned and therefore
# converted to 0

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200})
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000})

# option 2
def cakes(recipe, available)
  needed = recipe.map(&:dup).to_h
  total = available.map(&:dup).to_h
  
  needed.each do |ingredient, value|
    if total.has_key?(ingredient)
      needed[ingredient] = total[ingredient] / value
    else
      return 0
    end
  end

  needed.min_by { |_, value| value }[1]
end
