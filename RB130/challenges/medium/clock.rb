# Create a clock that is independent of date.

# You should be able to add minutes to and subtract minutes from the time represented by a
# given clock object. Two clock objects that represent the same time should be equal to each other.

# You may not use any built-in date or time functionality; just use arithmetic operations.

class Clock
  attr_accessor :time
  TOTAL_MINS = 1440

  def initialize(mins)
    @time = mins
  end

  def self.at(hours, mins=0)
    minutes = total_mins(hours, mins)
    clock = new(minutes)
  end

  def self.total_mins(hours, mins)
    (hours * 60) + mins
  end

  def subtract(mins)
    while mins > TOTAL_MINS
      mins -= TOTAL_MINS
    end
    mins
  end

  def -(minutes)
    mins = subtract(minutes)
    (time - mins).negative? ? self.time = TOTAL_MINS - (mins - time) : self.time -= mins
    self
  end

  def +(minutes)
    mins = subtract(minutes)
    total = time + mins
    total > TOTAL_MINS ? self.time = total - TOTAL_MINS : self.time = total
    self
  end

  def to_s
    total_hours = time / 60.0
    hours, remainder = total_hours.divmod(1)
    minutes = (remainder * 60).round
    format('%02d:%02d', hours, minutes)
  end

  def ==(other)
    time == other.time
  end
end

# option 2
class Clock
  attr_reader :hour, :minute

  ONE_DAY = 24 * 60

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  def +(add_minutes)
    minutes_since_midnight = compute_minutes_since_midnight + add_minutes
    while minutes_since_midnight >= ONE_DAY
      minutes_since_midnight -= ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def -(sub_minutes)
    minutes_since_midnight = compute_minutes_since_midnight - sub_minutes
    while minutes_since_midnight < 0
      minutes_since_midnight += ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def ==(other_time)
    hour == other_time.hour && minute == other_time.minute
  end

  def to_s
    format('%02d:%02d', hour, minute);
  end

  private

  def compute_minutes_since_midnight
    total_minutes = 60 * hour + minute
    total_minutes % ONE_DAY
  end

  def compute_time_from(minutes_since_midnight)
    hours, minutes = minutes_since_midnight.divmod(60)
    hours %= 24
    new(hours, minutes)
  end
end
