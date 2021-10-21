# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

require 'minitest/autorun'

class Testing < Minitest::Test
  def test_downcase
    assert_equal('xyz', value.downcase)
  end
end

# can also remove the parentheses: assert_equal 'xyz', value.downcase
# first argument is expected value
# second argument is actual value
