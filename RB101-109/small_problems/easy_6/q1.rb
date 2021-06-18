# Write a method that takes a floating point number that represents an angle
# between 0 and 360 degrees and returns a string that represents that angle
# in degrees, minutes and seconds
# use ° to represent degrees
# use ' to represent minutes
# use " to represent seconds
# degree has 60 minutes
# minute has 60 seconds

DEGREE = "\xC2\xB0"

def dms(integer)
  starting_figure = integer.round(2)
  degrees = starting_figure.to_i

  minutes = starting_figure % degrees rescue 0
  minutes = minutes.round(2) * 60

  seconds = minutes % minutes.to_i rescue 0
  seconds = seconds.round(2) * 60

puts "%(#{degrees}#{DEGREE}#{format('%02d', minutes.to_i)}\'#{format('%02d', seconds.to_i)}\")"
end

# test cases
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
dms(321.12) == %(321°07'12")

# LS way

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

# further exploration
# how can you change the method to take values outside of the range 0..360

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE
TOTAL_DEGREES = 360

def dms(degrees_float)
  while degrees_float > TOTAL_DEGREES
    degrees_float -= TOTAL_DEGREES
  end
  while degrees_float < 0
    degrees_float += TOTAL_DEGREES
  end
  
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  puts format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end
