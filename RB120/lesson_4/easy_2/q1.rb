# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
oracle.predict_the_future

# The choices instance method chooses a string at random from an array, which is subsequently added to the string in predict the future
# method, the entire string will be returned but not outputted to the display
