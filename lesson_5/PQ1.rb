# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

# INPUTS: an array of number strings
# OUTPUTS: an array of number strings (sorted by descending numeric value)
# RULES: 
# - Must be sorted by DESCENDING numeric value
# QUESTIONS:
# - Unsure whether I need to reorder the existing array or create a new array
#
# ALGORITHM:
# Create method `reorder_array` that takes one argument, an array (`array`)
# - Sort each element of `array` by:
#   - Numeric order of the elements (converted to integers)

def reorder_array(array)
  array.sort_by do |element|
    -element.to_i
  end
end

p reorder_array(arr)