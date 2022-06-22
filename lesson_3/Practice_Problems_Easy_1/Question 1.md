# Question
What would you expect the code below to print out?
```rb
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```


# Solution
The above code will print out the following:

```ruby
1
2
2
3
```

`numbers.uniq` returned a new `Array` object with unique elements, but it did not modify the `numbers` object. The `puts` method, in addition to calling `to_s` on its argument, writes each element on a new line if passed an array. That’s why the output appears as shown above.

Additional note: had the last line been `p numbers` instead, the output would have been `[1, 2, 2, 3]` because the `p` method automatically calls `inspect` on its argument, which gives a different formatting on the output. Furthermore, we could have also done `puts numbers.inspect` and the output would have been the same as using the `p` method.