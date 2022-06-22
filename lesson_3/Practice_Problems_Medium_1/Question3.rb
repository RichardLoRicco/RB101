def factors(number)
  divisor = number
  factors = []
  if number > 0
    loop do
     factors << number / divisor if number % divisor == 0
      divisor -= 1
      break if divisor <= 0
    end
    factors
  elsif number <= 0
    puts "Please enter a positive nonzero number."
  end
end

puts factors(12)