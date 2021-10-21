# Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

require 'minitest/autorun'

class Testing < Minitest::Test
  def test_hire
    assert_raises(NoExperienceError) do
      employee.hire
    end
  end
end
