# We have an Oracle class and a Roadtrip class that inherits from the Oracle class

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following

trip = RoadTrip.new
trip.predict_the_future

# The predict_the_future method is called on an object instantiated from the RoadTrip class and therefore will look firstly in self
# for the choices method. So it will append a string at random from this array: ["visit Vegas", "fly to Fiji", "romp in Rome"]
# to 'You will'
# If you wished for it to select from the array in the Oracle class then you simply need to change the name of the method in RoadTrip
