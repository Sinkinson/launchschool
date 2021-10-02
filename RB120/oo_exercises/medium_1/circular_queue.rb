# A circular queue is a collection of objects stored in a buffer that is treated as though it is connected end-to-end in a circle.
# When an object is added to this circular queue, it is added to the position that immediately follows the most recently added
# object, while removing an object always removes the object that has been in the queue the longest.

# This works as long as there are empty spots in the buffer. If the buffer becomes full, adding a new object to the queue requires
# getting rid of an existing object; with a circular queue, the object that has been in the queue the longest is discarded and
# replaced by the new object.

# Assuming we have a circular queue with room for 3 objects, the circular queue looks and acts like this:

=begin
P1	P2	P3	Comments
            All positions are initially empty
1			      Add 1 to the queue
1	  2		    Add 2 to the queue
2		        Remove oldest item from the queue (1)
2	  3	      Add 3 to the queue
4	  2	  3	  Add 4 to the queue, queue is now full
4		3	      Remove oldest item from the queue (2)
4	  5	  3	  Add 5 to the queue, queue is full again
4	  5	  6	  Add 6 to the queue, replaces oldest element (3)
7	  5	  6	  Add 7 to the queue, replaces oldest element (4)
7		6	      Remove oldest item from the queue (5)
7			      Remove oldest item from the queue (6)
            Remove oldest item from the queue (7)
            Remove non-existent item from the queue (nil)
=end

# Your task is to write a CircularQueue class that implements a circular queue for arbitrary objects. The class should obtain the
# buffer size with an argument provided to CircularQueue::new, and should provide the following methods:

# - enqueue to add an object to the queue
# - dequeue to remove (and return) the oldest object in the queue. It should return nil if the queue is empty.

# You may assume that none of the values stored in the queue are nil (however, nil may be used to designate empty spots in the buffer).

# Examples:

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

# solution 1

class CircularQueue
  def initialize(size)
    @queue = Array.new(size)
  end

  def enqueue(value)
    index = queue_full? ? find_oldest_index : find_nil
    queue[index] = value
  end

  def dequeue
    return nil unless queue.any?
    oldest_value = find_oldest_value
    index = find_oldest_index
    queue[index] = nil
    oldest_value
  end

  private
  
  attr_reader :queue

  def [](idx)
    queue[idx]
  end

  def []=(idx, value)
    queue[idx] = value
  end

  def queue_full?
    queue.all?
  end

  def find_oldest_index
    value = find_oldest_value
    queue.index(value)
  end

  def find_oldest_value
    queue.reject { |element| element.nil? }.min
  end

  def find_nil
    queue.each_with_index do |val, idx|
      next if queue[idx..-1].any? unless !queue[-1].nil?
      return idx if val == nil
    end
  end
end

# solution 2

class CircularQueue
  def initialize(size)
    @size = size
    @queue = []
  end

  def enqueue(obj)
    dequeue if full?
    @queue << obj
  end

  def dequeue
    @queue.shift
  end

  def full?
    @queue.size == @size
  end
end

# LS solution

class CircularQueue
  def initialize(size)
    @buffer = [nil] * size
    @next_position = 0
    @oldest_position = 0
  end

  def enqueue(object)
    unless @buffer[@next_position].nil?
      @oldest_position = increment(@next_position)
    end

    @buffer[@next_position] = object
    @next_position = increment(@next_position)
  end

  def dequeue
    value = @buffer[@oldest_position]
    @buffer[@oldest_position] = nil
    @oldest_position = increment(@oldest_position) unless value.nil?
    value
  end

  private

  def increment(position)
    (position + 1) % @buffer.size
  end
end

# The increment solution here is useful as it wraps back around to 0 if the position size reaches the size of the array
# meaning we never increment past the end position
