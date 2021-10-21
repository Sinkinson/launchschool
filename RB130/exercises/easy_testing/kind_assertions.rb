# Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).

require 'minitest/autorun'

class Testing < Minitest::Test
  def test_class
    assert_kind_of Numeric, value
  end
end

# kind_of checks if the second arugment is an instance of the given class or one of its subclasses
