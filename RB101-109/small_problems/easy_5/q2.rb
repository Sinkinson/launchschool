# time of day can be represented as the number of minutes before or after midnight
# number positive --> after midnight
# number negative --> before midnight

# write a method that takes a time using this minute based format and returns the time
# of day in the 24 hour format (hh:mm)
# method should work with any integer input

# LS way

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# initial attempt

def time_of_day(integer)
  if integer < 1440 && integer >= 0
    a, b = integer.divmod(60)
    format('%02d:%02d', a, b)
  elsif integer >= 1440
    hours = integer % 1440
    a, b = hours.divmod(60)
    format('%02d:%02d', a, b)
  elsif integer < 0 && integer > -1440
    a, b = integer.divmod(60)
    a = a + 24
    format('%02d:%02d', a, b)
  elsif integer <= -1440
    hours = integer % 1440
    a, b = hours.divmod(60)
    format('%02d:%02d', a, b)
  end
end
