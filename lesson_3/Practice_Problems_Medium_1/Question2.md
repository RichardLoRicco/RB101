# Question
The result of the following statement will be an error:

```ruby
puts "the value of 40 + 2 is " + (40 + 2)
```

Why is this and what are two possible ways to fix this?



# Solution
The above code results in an error because of a TypeError. More specifically, it is trying to combine a string and an integer; the integer must be converted to a string in order for the code to run.  

First possible fix: --> *to_s*

```rb
puts "the value of 40 + 2 is " + (40 + 2).to_s
```

Second possible fix: --> *String Interpolation*

```rb
puts "the value of 40 + 2 is #{(40 + 2)}"
```


# Launch School Solution

This will raise an error `TypeError: no implicit conversion of Integer into String` because `(40+2)` results in an integer and it is being concatenated to a string.

To fix this either call

```ruby
(40+2).to_s
```

or use string interpolation:

```ruby
puts "the value of 40 + 2 is #{40 + 2}"
```




## Notes


### Source