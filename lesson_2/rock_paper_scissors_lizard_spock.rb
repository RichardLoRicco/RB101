VALID_CHOICES = %w(r p sc l sp)

player_wins = 0
computer_wins = 0

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'r' && second == 'sc') ||
    (first == 'p' && second == 'r') ||
    (first == 'sc' && second == 'p') ||
    (first == 'r' && second == 'l') ||
    (first == 'l' && second == 'p') ||
    (first == 'l' && second == 'sp') ||
    (first == 'sc' && second == 'l') ||
    (first == 'p' && second == 'sp') ||
    (first == 'sp' && second == 'sc') ||
    (first == 'sp' && second == 'r')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def compute_tally(player, computer)
  if win?(player, computer)
    self.player_wins = player_wins + 1
  elsif win?(computer, player)
    self.computer_wins = computer_wins + 1
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(", ")}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer = VALID_CHOICES.sample

  prompt("You choice: #{choice}; Computer chose: #{computer}")

  display_results(choice, computer)

  compute_tally(choice, computer)
  
  prompt("The current score is: You #{player_wins}, Computer #{computer_wins}")
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")