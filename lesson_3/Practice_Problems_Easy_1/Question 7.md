# Question
If we build an array like this:

```ruby
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
```

We will end up with this "nested" array:

```ruby
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
```

Make this into an un-nested array.



# Solution

```rb
flintstones.flatten!
```



# Launch School Solution

```ruby
flintstones.flatten!
```

Nesting data structures in this way is quite common in Ruby and programming in general. We will explore this in much greater depth in a future Lesson.





## Notes


##### flatten → new_ary
##### flatten(level) → new_ary
Returns a new array that is a one-dimensional flattening of `self` (recursively).

That is, for every element that is an array, extract its elements into the new array.

The optional `level` argument determines the level of recursion to flatten.

```rb
s = [ 1, 2, 3 ]           #=> [1, 2, 3]
t = [ 4, 5, 6, [7, 8] ]   #=> [4, 5, 6, [7, 8]]
a = [ s, t, 9, 10 ]       #=> [[1, 2, 3], [4, 5, 6, [7, 8]], 9, 10]
a.flatten                 #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a = [ 1, 2, [3, [4, 5] ] ]
a.flatten(1)              #=> [1, 2, 3, [4, 5]]
```

#### flatten! → ary or nil
#### flatten!(level) → ary or nil

Flattens `self` in place.

Returns `nil` if no modifications were made (i.e., the array contains no subarrays.)

The optional `level` argument determines the level of recursion to flatten.

```rb
a = [ 1, 2, [3, [4, 5] ] ]
a.flatten!   #=> [1, 2, 3, 4, 5]
a.flatten!   #=> nil
a            #=> [1, 2, 3, 4, 5]
a = [ 1, 2, [3, [4, 5] ] ]
a.flatten!(1) #=> [1, 2, 3, [4, 5]]
```



### Source
https://ruby-doc.org/core-2.5.1/Array.html#method-i-flatten