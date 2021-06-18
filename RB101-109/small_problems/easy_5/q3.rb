# write two methods that each take a time of day in 24 hour format and return the
# number of minutes before or after midnight respectively. Both methods should return a value in the range of 0..1439

def after_midnight(time)
  total_time = 0
  time_arr = time.split(//)
  time_arr.delete(':')
  hours = time_arr.values_at(0,1).join.to_i
  minutes = time_arr.values_at(2,3).join.to_i
  total_minutes = (hours * 60) + minutes
  total_minutes == 1440 ? 0 : total_time += total_minutes
end

def before_midnight(time)
  total_time = 1440
  time_arr = time.split(//)
  time_arr.delete(':')
  hours = time_arr.values_at(0,1).join.to_i
  minutes = time_arr.values_at(2,3).join.to_i
  total_minutes = (hours * 60) + minutes
  total_minutes == 0 ? 0 : total_time -= total_minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# LS way

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end
