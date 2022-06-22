# Question
In this hash of people and their age,

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

see if "Spot" is present.

**Bonus:** What are two other hash methods that would work just as well for this solution?



# Solution

```rb
ages.has_key?("Spot")
```

##### Other hash methods that could work:
```rb
# First other method

ages.fetch("Spot")

  

# Second other method

ages.assoc("Spot")
```

# Launch School Solution
```ruby
ages.key?("Spot")
```

**Bonus Answer:**

`Hash#include?` and `Hash#member?`








## Notes


### Source
https://ruby-doc.org/core-3.1.2/Hash.html#method-i-key-3F