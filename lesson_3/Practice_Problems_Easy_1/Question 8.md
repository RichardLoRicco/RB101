# Question

Given the hash below

```ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
```

Turn this into an array containing only two elements: Barney's name and Barney's number


# Solution
```rb
p flintstones.assoc("Barney")
```


# Launch School Solution

```rb
p flintstones.assoc("Barney")
#=> ["Barney", 2]
```






## Notes

##### assoc(key) → new_array or nil

If the given `key` is found, returns a 2-element Array containing that key and its value:

```rb
h = {foo: 0, bar: 1, baz: 2}
h.assoc(:bar) # => [:bar, 1]

Returns `nil` if key `key` is not found.```

### Source
https://ruby-doc.org/core-3.1.2/Hash.html#method-i-assoc