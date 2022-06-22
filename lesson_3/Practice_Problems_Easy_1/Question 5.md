# Question
Programmatically determine if 42 lies between 10 and 100.

_hint: Use Ruby's range object in your solution._


# Solution
```rb
puts (10..101).include?(42)
```

# Launch School Solution
```rb
(10..100).cover?(42)
```


## Notes
They used the `cover?(obj)` method here, whereas I used `include?`


### Source
https://ruby-doc.org/core-2.5.0/Range.html#method-i-include-3F

### include?(obj) → true or false

Returns `true` if `obj` is an element of the range, `false` otherwise. If begin and end are numeric, comparison is done according to the magnitude of the values.

("a".."z").include?("g")   #=> true
("a".."z").include?("A")   #=> false
("a".."z").include?("cc")  #=> false