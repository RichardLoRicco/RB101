# Question
Describe the difference between `!` and `?` in Ruby. And explain what would happen in the following scenarios:

1.  what is `!=` and where should you use it?
2.  put `!` before something, like `!user_name`
3.  put `!` after something, like `words.uniq!`
4.  put `?` before something
5.  put `?` after something
6.  put `!!` before something, like `!!user_name`

# Solution
`!` is a Boolean negate (meaning it essentially reverses a Boolean value (as in from `True` to `False` or vis versa)), whereas `?` returns a Boolean value.

1.  **What is `!=` and where should you use it?**
    
    `!?` returns true if two objects are not-equal, otherwise it returns false. You should use it when you want to determine whether two objects are not equal to each other.
    
2.  **put `!` before something, like `!user_name`**
    
    If you put **`!`** before something, you would essentially negate the boolean that would be returned. Therefore, if you write `!user_name`, `False` would be returned if `user_name` is truthy, and `True` would be returned if `user_name` if falsy.
    
3.  **put `!` after something, like `words.uniq!`**
    
    If `!` is located after a method, this means it is likely part of the method. This would make `uniq` mutate the array. It would remove the duplicate elements from the array and return the new array with the duplicates removed . If no changes are made (i.e., no duplicated are found, it would return `nil`.
    
4.  **put `?` before something**
    
    `? :` is the ternary operator for if...else
    
5.  **put `?` after something**
    
    This would mean it is part of a method.
    
6.  **put `!!` before something, like `!!user_name`**
    
    Turns the object into its boolean equivalent

# Launch School Solution
Just to clarify, if you see `!` or `?` at the end of the method, it's actually part of the method name, and not Ruby syntax. Therefore, you really don't know what the method is doing, even if it ends in those characters -- it depends on the method implementation. The other uses are actual Ruby syntax:

-   `!=` means "not equals"
-   `? :` is the ternary operator for if...else
-   `!!<some object>` is used to turn any object into their boolean equivalent. (Try it in irb)
-   `!<some object>` is used to turn any object into the opposite of their boolean equivalent, just like the above, but opposite.