# Question
See if the name "Dino" appears in the string below:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."

```

# Solution
```rb
advice.include?('Dino')
```

# Launch School Solution
```rb
advice.match?("Dino")

# Note that this is not a perfect solution, as it would match any substring with Dino in it.
```




## Notes
Launch School uses the `match` method, whereas I use the `include?` method. Not sure if one is better than the other and if so why.

### Source