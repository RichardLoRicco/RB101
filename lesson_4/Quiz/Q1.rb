# What happens if we try to initialize a Hash that contains duplicate keys?

# Example:
hsh = {a: 100, b: 200, c: 300, a: 400}

# The value for the second occurrence of the duplicate key overwrites the value for the first occurence.