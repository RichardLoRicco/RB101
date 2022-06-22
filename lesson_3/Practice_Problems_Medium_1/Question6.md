# Question

What is the output of the following code?

```ruby
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
```

# Solution

The code will output 34. `mess_with_it` does not mutate answer



# Launch School Solution

```rb
34
```




## Notes


### Source