# Question
Starting with the string:

```ruby
famous_words = "seven years ago..."
```

show two different ways to put the expected "Four score and " in front of it.



# Solution
```rb
# Option 1

puts "Four score and #{famous_words}"

  

# Option 2

puts "Four score and " + famous_words
```

# Launch School Solution

```ruby
"Four score and " + famous_words
```

or

```ruby
famous_words.prepend("Four score and ")
```

or

```ruby
"Four score and " << famous_words
```


## Notes


### Source