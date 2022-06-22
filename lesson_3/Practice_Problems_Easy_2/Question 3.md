# Question
We have most of the Munster family in our age hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
```

add ages for Marilyn and Spot to the existing hash

```ruby
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
```



# Solution
```rb
ages.merge!(additional_ages)
```



# Launch School Solution
```rb
ages.merge!(additional_ages)
```





## Notes
##### Merge
Returns the new Hash formed by merging each of `other_hashes` into a copy of `self`.

Each argument in `other_hashes` must be a Hash.

---

With arguments and no block:

-   Returns the new Hash object formed by merging each successive Hash in `other_hashes` into `self`.
    
-   Each new-key entry is added at the end.
    
-   Each duplicate-key entry's value overwrites the previous value.
    

Example:
```rb 
h = {foo: 0, bar: 1, baz: 2}
h1 = {bat: 3, bar: 4}
h2 = {bam: 5, bat:6}
h.merge(h1, h2) # => {:foo=>0, :bar=>4, :baz=>2, :bat=>6, :bam=>5}
```

### Source
https://ruby-doc.org/core-3.1.2/Hash.html#method-i-merge