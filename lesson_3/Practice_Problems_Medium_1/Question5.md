# Question
Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

```ruby
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

How would you fix this so that it works?

# Solution

The problem pertains to variable scope. More specifically, `limit` cannot be accessed from within the `fib` method. Therefore, I added an parameter to the `fib` method called `methodlimit` . When calling the `fib` method, I then passed `limit` into the method as an argument, so it can be accessed within the method. 

Below is an implementation of the fix described above:

```rb
limit = 15

def fib(first_num, second_num, methodlimit = 15)
  while first_num + second_num < methodlimit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"
```

# Launch School Solution

Ben defines `limit` before he calls `fib`. But `limit` is not visible in the scope of `fib` because `fib` is a method and does not have access to any local variables outside of its scope.

You can make `limit` an additional argument to the definition of the `fib` method and pass it in when you call `fib`.





## Notes


### Source