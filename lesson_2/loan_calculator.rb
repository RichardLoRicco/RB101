def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_f() != 0
end
loop do
  prompt("Welcome to the Mortgage/Car Loan Calculator!")

  loan_amount = ""
  loop do
    prompt("Please enter the loan amount:")
    loan_amount = Kernel.gets().chomp()
    if valid_number?(loan_amount)
      break
    else
      prompt("Hmmm... that doesn't look like a valid number")
    end
  end

  apr = ""
  loop do
    prompt("Please enter the Annual Percentage Rate (APR) in decimal form:")
    apr = Kernel.gets().chomp()
    if valid_number?(apr)
      break
    else
      prompt("Hmmm... that doesn't look like a valid number")
    end
  end

  loan_duration = ""
  loop do
    prompt("Please enter the loan duration in months:")
    loan_duration = Kernel.gets().chomp()
    if valid_number?(loan_duration)
      break
    else
      prompt("Hmmm... that doesn't look like a valid number")
    end
  end

  loan_amount = loan_amount.to_f
  apr = apr.to_f
  loan_duration = loan_duration.to_f

  monthly_interest_rate = apr / 12
  # puts monthly_interest_rate

  monthly_payment = loan_amount * 
                    (monthly_interest_rate / 
                    (1 - (1 + monthly_interest_rate)**(-loan_duration)))
  prompt("Your monthly payment is #{monthly_payment}")

  prompt("Would you like to make another calculation?")
  prompt("Enter yes or no:")
  another = Kernel.gets().chomp()
  break unless another.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
prompt("Good bye!")