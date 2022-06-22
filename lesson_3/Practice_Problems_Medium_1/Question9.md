# Question

Consider these two simple methods:

```ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
```

What would be the return value of the following method invocation?

```ruby
bar(foo)
```

# Solution

```rb
"no"
```

# Launch School Solution

```rb
"no"
```

This is because the value returned from the `foo` method will always be `"yes"` , and `"yes" == "no"` will be `false`.






## Notes


### Source