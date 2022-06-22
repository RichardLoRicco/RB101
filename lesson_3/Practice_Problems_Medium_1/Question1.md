# Question
Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

```none
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
```

# Solution
```rb
10.times {|number| puts " " * number + "The Flintstones Rock"}
```

# Launch School Solution

```rb
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }
```





## Notes


### Source 
https://docs.ruby-lang.org/en/master/Integer.html#method-i-times