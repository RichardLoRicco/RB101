# Question
The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

```ruby
numbers = [1, 2, 3, 4, 5]
```

What do the following method calls do (assume we reset `numbers` to the original array between method calls)?

```ruby
numbers.delete_at(1)
numbers.delete(1)
```

# Solution
`numbers.delete_at(1)` will delete the element at index 1 and return that element. Here, it will delete 2 and return that value. Therefore, `numbers` will now look as follows:
```rb
numbers = [1, 3, 4, 5]
```

`numbers.delete(1)`, on the other hand, will delete any item that is equal to 1, returning the last deleted item. Here, it will delete and return 1 (located at index 0). Therefore `numbers` will now look as follows:
```rb
numbers = [2, 3, 4, 5]
```


# Launch School Solution
```ruby
numbers.delete_at(1) # numbers is now [1, 3, 4, 5]
```

(note that the array is operated on directly and the return value of the call is the removed item `2`)

```ruby
numbers.delete(1) # numbers is now [2, 3, 4, 5]
```

(note that the array is operated on directly and the return value of the call is the removed item `1`)

Another thing to notice is that while both of these methods operate on the contents of the referenced array and modify it in place (rather than just returning a modified version of the array) these methods do NOT have the usual `!` at the end of the method name for "modify in place" method names.