# Question
Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like `<<` or `+` for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

```ruby
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
```

# Solution
I GOT THIS WRONG. I THOUGHT THERE WAS NO DIFFERENCE.

# Launch School Solution

Yes, there is a difference. While both methods have the same return value, in the first implementation, the input argument called `buffer` will be modified and will end up being changed after `rolling_buffer1` returns. That is, the caller will have the input array that they pass in be different once the call returns. In the other implementation, `rolling_buffer2` will not alter the caller's input argument.




## Notes
I should review this. I could have figured out the difference if I checked the arrays after the methods ran.

`rolling_buffer2` is a mutating method, whereas `rolling_buffer1` is a non-mutating method. 


### Source