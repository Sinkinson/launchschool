# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off.
# You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle
# switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat
# this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

def thousand_lights(n)
  lights = (1..n).map { |num| [num, 0] }

  n.times do |iteration|
    lights.each do |sub_arr|
      if sub_arr[0] % (iteration + 1) == 0
        sub_arr[1] += 1
      end
    end
  end

    result = lights.select do |sub_arr|
      sub_arr[1].odd?
    end

    result.map(&:first)
end

p thousand_lights(5)
p thousand_lights(10)

# refactor
def thousand_lights(n)
  lights = (1..n).map { |num| [num, 0] }

  n.times do |iteration|
    lights.each { |sub_arr| sub_arr[1] += 1 if sub_arr[0] % (iteration + 1) == 0 }
  end

  lights.select { |sub_arr| sub_arr[1].odd? }.map(&:first)
end

# LS way
# initialize the lights hash
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(1000)