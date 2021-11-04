# Meetups are a great way to meet people who share a common interest. Typically, meetups happen monthly on the
# same day of the week. For example, a meetup's meeting may be set as:

# The first Monday of January 2021
# The third Tuesday of December 2020
# The teenth wednesday of December 2020
# The last Thursday of January 2021
# In this program, we'll construct objects that represent a meetup date. Each object takes a month number (1-12)
# and a year (e.g., 2021). Your object should be able to determine the exact date of the meeting in the specified
# month and year. For instance, if you ask for the 2nd Wednesday of May 2021, the object should be able to
# determine that the meetup for that month will occur on the 12th of May, 2021.

# The descriptors that may be given are strings: 'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'.
# The case of the strings is not important; that is, 'first' and 'fIrSt' are equivalent. Note that "teenth" is a
# made up word. There was a meetup whose members realised that there are exactly 7 days that end in '-teenth'.
# Therefore, it's guaranteed that each day of the week (Monday, Tuesday, ...) will have exactly one date that is
# the "teenth" of that day in every month. That is, every month has exactly one "teenth" Monday, one "teenth"
# Tuesday, etc. The fifth day of the month may not happen every month, but some meetup groups like that irregularity.

# The days of the week are given by the strings 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday',
# and 'Sunday'. Again, the case of the strings is not important.

require 'date'

class Meetup
  attr_reader :start_date, :end_date

  def initialize(year, month)
    @start_date = Date.civil(year, month)
    @end_date = Date.civil(year, month, -1)
  end

  def day(day, position)
    return teenth(day, position) if position.downcase == "teenth"
    day_method = change_to_method(day)
    target_day = convert(position)
    days_of_interest = (start_date..end_date).select { |date| date.send day_method }
    days_of_interest[target_day]
  end

  def convert(position)
    case position.downcase
    when 'first' then 0
    when 'second' then 1
    when 'third' then 2
    when 'fourth' then 3
    when 'fifth' then 4
    when 'last' then -1
    end
  end

  def change_to_method(day)
    day.downcase + '?'
  end

  def teenth(day, position)
    day_method = change_to_method(day)
    days_of_interest = (start_date..end_date).select { |date| (13..19).include?(date.mday) }
    days_of_interest.select { |date| date.send day_method }[0]
  end
end

# option 2
class Meetup
  SCHEDULE_START_DAY = {
    'first' => 1,
    'second' => 8,
    'third' => 15,
    'fourth' => 22,
    'fifth' => 29,
    'teenth' => 13,
    'last' => nil
  }.freeze

  def initialize(year, month)
    @year = year
    @month = month
    @days_in_month = Date.civil(@year, @month, -1).day
  end

  def day(weekday, schedule)
    weekday = weekday.downcase
    schedule = schedule.downcase

    first_possible_day = first_day_to_search(schedule)
    last_possible_day = [first_possible_day + 6, @days_in_month].min

    (first_possible_day..last_possible_day).detect do |day|
      date = Date.civil(@year, @month, day)
      break date if day_of_week_is?(date, weekday)
    end
  end

  private

  def first_day_to_search(schedule)
    SCHEDULE_START_DAY[schedule] || (@days_in_month - 6)
  end

  def day_of_week_is?(date, weekday) # rubocop:disable Metrics/CyclomaticComplexity
    case weekday
    when 'monday'    then date.monday?
    when 'tuesday'   then date.tuesday?
    when 'wednesday' then date.wednesday?
    when 'thursday'  then date.thursday?
    when 'friday'    then date.friday?
    when 'saturday'  then date.saturday?
    when 'sunday'    then date.sunday?
    end
  end
end
