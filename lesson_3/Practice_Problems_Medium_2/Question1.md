# Question

Every object in Ruby has access to a method called `object_id`, which returns a numerical value that uniquely identifies the object. This method can be used to determine whether two variables are pointing to the same object.

Take a look at the following code and predict the output:

```ruby
a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id
```

# Solution
I predict that a and c will have the same `object_id`, but b will have a different `object_id`

# Launch School Solution

```ruby
puts a.object_id # 60
puts b.object_id # 80
puts c.object_id # 60
```

When you run the code, the exact object ids may differ; however, the output should make it clear that **`a` and `b` reference different objects.** Don't be deceived by appearances — the two objects look the same (ie, they both have the value `"forty two"`) but they are still different objects.

Meanwhile, the object ids show that **`a` and `c` reference the same object.** This is because `c` was initialized to the object referenced by `a`. No surprises here.

(Object ids are a private implementation detail of how Ruby executes the code "under the hood", and may differ depending on your specific environment, Ruby version, etc. There's no guarantee that an object will have the same object id in two different runs of the program, so never rely on the specific value of the id).



## Notes


### Source