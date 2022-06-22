# Question
Alan wrote the following method, which was intended to show all of the factors of the input number:

```ruby
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
```

Alyssa noticed that this will fail if the input is `0`, or a negative number, and asked Alan to change the loop. How can you make this work without using `begin`/`end`/`until`? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

#### Bonus 1

What is the purpose of the `number % divisor == 0` ?

#### Bonus 2

What is the purpose of the second-to-last line (`line 8`) in the method (the `factors` before the method's `end`)?

# Solution

This is how I would make this owrk without using  `begin`/`end`/`until`: 

```rb
def factors(number)
  divisor = number
  factors = []
  if number > 0
    loop do
     factors << number / divisor if number % divisor == 0
      divisor -= 1
      break if divisor <= 0
    end
    factors
  elsif number <= 0
    puts "Please enter a positive nonzero number."
  end
end

puts factors(-10)
```

#### Bonus 1
The purpose of the `number % divisor == 0`  is to check that there is no remainder when `number` is divided by `divisor`. If this is the case, we can say that `number` is divisible by `divisor`. These are the values that are factors of `number`; as such, these are the only values we want to add to the `factors` array, and the above code ensures that this is the case and that non-factor values are not added to the `factors` array. 

#### Bonus 2
The purpose of the second-to-last line is to return the `factors` array when the `factors` function is executed. 


# Launch School Solution

Use a `while` condition for the loop:

```ruby
while divisor > 0
  factors << number / divisor if number % divisor == 0
  divisor -= 1
end
```

#### Bonus Answer 1

Allows you to determine if the result of the division is an integer number (no remainder).

#### Bonus Answer 2

This is what is the actual return value from the method. Recall that without an explicit `return` statement in the code, the return value of the method is the last statement executed. If we omitted this line, the code would execute, but the return value of the method would be `nil`.




## Notes
The Launch School answer is more efficient than the answer I chose. I used an `if` statement to ensure the function only ran when `number` was greater than zero. I could have just used a `while` loop so it would run while `divisor` was greater than zero (since `divisor` starts out equal to `number`)

### Source