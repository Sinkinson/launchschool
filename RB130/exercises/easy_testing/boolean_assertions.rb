# Write a minitest assertion that will fail if the value.odd? is not true.

require 'minitest/autorun'

class Testing < Minitest::Test
  def test_odd
    assert_equals(true, value.odd?)
  end
end

# option 2

assert value.odd?, 'value not odd'
