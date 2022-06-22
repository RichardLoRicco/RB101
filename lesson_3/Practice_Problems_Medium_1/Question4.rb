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

input_array = %w(1 2 3 4 5 6 7 8)
buffer = %w(1 2 3 4 5 6 7 8)

p rolling_buffer1(buffer, 8, 9)
p rolling_buffer2(input_array, 8, 9)

p buffer 
p input_array