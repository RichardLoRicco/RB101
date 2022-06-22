# Question
In the previous practice problem we added Dino to our array like this:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
```

We could have used either `Array#concat` or `Array#push` to add Dino to the family.

How can we add multiple items to our array? (Dino and Hoppy)



# Solution
```rb
flintstones.insert(3, "Dino", "Hoppy")
# inserted Dino and Hoppy at index 3
```

# Launch School Solution
```ruby
flintstones.push("Dino").push("Hoppy")   # push returns the array so we can chain
```

or

```ruby
flintstones.concat(%w(Dino Hoppy))  # concat adds an array rather than one item
```





## Notes
Pretty sure all of the above work, including the method I used.

### Source