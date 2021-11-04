# Create a custom set type.

# Sometimes it is necessary to define a custom data structure of some type, like a set. In this
# exercise you will define your own set type. How it works internally doesn't matter, as long
# as it behaves like a set of unique elements that can be manipulated in several well defined ways.

# In some languages, including Ruby and JavaScript, there is a built-in Set type. For this problem,
# you're expected to implement your own custom set type. Once you've reached a solution, feel free
# to play around with using the built-in implementation of Set.

# For simplicity, you may assume that all elements of a set must be numbers.

class CustomSet
  attr_reader :set

  def initialize(set=[])
    @set = set.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end

  def subset?(main)
    !!set.each { |value| return false unless main.contains?(value) }
  end
 
  def disjoint?(main)
    !!set.each { |value| return false if main.contains?(value) }
  end

  def eql?(main)
    set.sort == main.set.sort
  end

  def add(num)
    set << num unless contains?(num)
    self
  end

  def intersection(main)
    same_elements = set.select { |value| main.contains?(value) }
    CustomSet.new(same_elements)
  end

  def ==(main)
    eql?(main)
  end

  def difference(main)
    diff_elements = set.select { |value| !main.contains?(value) }
    CustomSet.new(diff_elements)
  end

  def union(main)
    CustomSet.new(set | main.set)
  end
end

# option 2
class CustomSet
  def initialize(set = [])
    @elements = set.uniq
  end

  def empty?
    elements.empty?
  end

  def intersection(other_set)
    same_elements = elements.select { |el| other_set.contains?(el) }
    CustomSet.new(same_elements)
  end

  def union(other_set)
    union_set = CustomSet.new(elements)
    other_set.elements.each { |el| union_set.add(el) }
    union_set
  end

  def difference(other_set)
    different_elements = elements.select { |el| !other_set.contains?(el) }
    CustomSet.new(different_elements)
  end

  def disjoint?(other_set)
    elements.none? { |el| other_set.contains?(el) }
  end

  def eql?(other_set)
    return false unless elements.length == other_set.elements.length
    elements.all? { |el| other_set.contains?(el) }
  end

  def subset?(other_set)
    elements.all? { |el| other_set.contains?(el) }
  end

  def add(element)
    elements.push(element) unless contains?(element)
    self
  end

  def contains?(element)
    elements.include?(element)
  end

  def ==(other_set)
    eql?(other_set)
  end

  protected

  attr_accessor :elements
end
