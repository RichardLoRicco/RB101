# Question
Write a one-liner to count the number of lower-case 't' characters in the following string:

```ruby
statement = "The Flintstones Rock!"
```

# Solution
```rb

```

# Launch School Solution

``` rb
statement.count('t')
```


## Notes

##### count(*selectors) → integer

Returns the total number of characters in `self` that are specified by the given `selectors` (see [Multiple Character Selectors](https://docs.ruby-lang.org/en/master/character_selectors_rdoc.html#label-Multiple+Character+Selectors)):

```rb
a = "hello world"
a.count "lo"                   #=> 5
a.count "lo", "o"              #=> 2
a.count "hello", "^l"          #=> 4
a.count "ej-m"                 #=> 4

"hello^world".count "\\^aeiou" #=> 4
"hello-world".count "a\\-eo"   #=> 4

c = "hello world\\r\\n"
c.count "\\"                   #=> 2
c.count "\\A"                  #=> 0
c.count "X-\\w"                #=> 3
```


### Source
https://docs.ruby-lang.org/en/master/String.html#method-i-count