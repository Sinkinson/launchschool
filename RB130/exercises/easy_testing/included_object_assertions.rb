# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

require 'minitest/autorun'

class Testing < Minitest::Test
  def test_included
    assert_includes(list, 'xyz')
  end
end
