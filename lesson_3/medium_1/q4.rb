# What is the difference between these two rolling buffer methods
# which one should be chosen for adding an element to the buffer

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# rolling_buffer1 will modify the argument the user passes in because the shovel
# operator mutates the caller
# rolling_buffer2 will provide the same return but will not modify the argument the
# user passes in because + is not a destructive method
