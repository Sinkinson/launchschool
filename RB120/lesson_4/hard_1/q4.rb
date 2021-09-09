# The designers of the vehicle management system now want to make an adjustment for how the range of vehicles is calculated.
# For the seaborne vehicles, due to prevailing ocean currents, they want to add an additional 10km of range even if the
# vehicle is out of fuel.

# Alter the code related to vehicles so that the range for autos and motorcycles is still calculated as before, but for
# catamarans and motorboats, the range method will return an additional 10km.

# We can just override the range method in the Seacraft class call super and then add 10

class Seacraft

  # ... existing Seacraft code omitted ...

  # the following is added to the existing Seacraft definition
  def range
    super + 10
  end
end
