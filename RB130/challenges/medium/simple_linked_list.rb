class Element
  def initialize(value, element=nil)
    @value_1 = value
    @value_2 = element
  end

  def datum
    @value_1
  end

  def tail?
    @value_2.nil?
  end

  def next
    @value_2
  end
end

class SimpleLinkedList
  def initialize
    @list = []
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def peek
    @list.last == nil ? nil :  @list.last.datum
  end

  def head
    @list.last
  end

  def push(value)
    element = Element.new(value, @list.last)
    @list << element
  end

  def pop
    @list.pop.datum
  end

  def reverse
    new_list = SimpleLinkedList.new
    @list.reverse_each do |element|
      new_list.push(element.datum)
    end
    new_list
  end

  def self.from_a(arr)
    return new if arr == nil
    new_list = new
    arr.reverse_each { |value| new_list.push(value) }
    new_list
  end

  def to_a
    @list.reverse.map(&:datum)
  end
end

# option 2
class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def size
    size = 0
    current_elem = @head
    while (current_elem)
      size += 1
      current_elem = current_elem.next
    end
    size
  end

  def empty?
    @head.nil?
  end

  def push(datum)
    element = Element.new(datum, @head)
    @head = element
  end

  def peek
    @head.datum if @head
  end

  def pop
    datum = peek
    new_head = @head.next
    @head = new_head
    datum
  end

  def self.from_a(array)
    array = [] if array.nil?

    list = SimpleLinkedList.new
    array.reverse_each { |datum| list.push(datum) }
    list
  end

  def to_a
    array = []
    current_elem = head
    while !current_elem.nil?
      array.push(current_elem.datum)
      current_elem = current_elem.next
    end
    array
  end

  def reverse
    list = SimpleLinkedList.new
    current_elem = head
    while !current_elem.nil?
      list.push(current_elem.datum)
      current_elem = current_elem.next
    end
    list
  end
end
