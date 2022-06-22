# Question

Shorten the following sentence:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

Review the [String#slice!](http://ruby-doc.org/core/String.html#method-i-slice-21) documentation, and use that method to make the return value `"Few things in life are as important as "`. But leave the `advice` variable as `"house training your pet dinosaur."`.

As a bonus, what happens if you use the [String#slice](http://ruby-doc.org/core/String.html#method-i-slice) method instead?



# Solution

```rb
advice.slice!("Few things in life are as important as ")
```

Bonus:
If I were to use the `String#slice` method instead, the program would return the sliced string, but advice would not be mutated and therefore would remain the same. 

# Launch School Solution

```ruby
advice.slice!(0, advice.index('house'))  # => "Few things in life are as important as "
p advice # => "house training your pet dinosaur."
```

Bonus: Using `slice`, the non-destructive version of `slice!`, would return a new string with the same text (`"Few things in life are as important as "`) but the `advice` variable would remain the same, pointing to the original string (`"Few things in life are as important as house training your pet dinosaur."`).




## Notes
Launch School's solution appears to slice starting at index 0 and ending prior to the string `house`.


### Source