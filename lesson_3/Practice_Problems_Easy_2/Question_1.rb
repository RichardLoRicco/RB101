ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.has_key?("Spot")

# First other method
ages.fetch("Spot")

# Second other method
ages.assoc("Spot")