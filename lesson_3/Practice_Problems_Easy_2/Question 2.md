# Question
Starting with this string:

```ruby
munsters_description = "The Munsters are creepy in a good way."
```

Convert the string in the following ways (code will be executed on original `munsters_description` above):

```none
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
```



# Solution
``` rb
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."

p munsters_description.swapcase

  

# "The munsters are creepy in a good way."

p munsters_description.capitalize

  

# "the munsters are creepy in a good way."

p munsters_description.downcase

  

# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

p munsters_description.upcase
```




# Launch School Solution
``` rb
munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!
```








## Notes


### Source