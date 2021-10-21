# Write a test that will fail if list and the return value of list.process are different objects.

require 'minitest/autorun'

class Testing < Minitest::Test
  def test_same_object
    assert_same(list, list.process)
  end
end

# checks to see if arugments are same object as determined by #equal?
