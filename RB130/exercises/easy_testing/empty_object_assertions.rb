# Write a minitest assertion that will fail if the Array list is not empty.

require 'minitest/autorun'

class Testing < Minitest::Test
  def test_empty
    assert_equal(true, list.empty?)
  end
end

# there is also an assertion for checking if the argument responds to the empty method with a true value.

assert_empty list
