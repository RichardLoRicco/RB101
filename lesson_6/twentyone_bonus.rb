SUITS = ['H', 'C', 'S', 'D']
CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
POINT_LIMIT = 21
DEALER_STAY_MIN = 17

player_score = 0
dealer_score = 0

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(CARDS).shuffle
end

def play_again?
  prompt "Would you like to play again? Enter 'y' if yes, 'n' if no."
  answer = gets.chomp.downcase[0]
  answer == 'y'
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(hand_total)
  hand_total > POINT_LIMIT
end

def press_lowercase_to_continue
  prompt "Press any key and hit enter to proceed."
  gets
  system 'clear'
end

def calculate_winner(plr_hand_total, dealr_hand_total)
  if plr_hand_total > dealr_hand_total
    "Player"
  elsif plr_hand_total < dealr_hand_total
    "Dealer"
  else
    "Tie"
  end
end

def output_winner(plr_hand_total, dealr_hand_total)
  if calculate_winner(plr_hand_total, dealr_hand_total) == "Player"
    prompt "Player has won."
  elsif calculate_winner(plr_hand_total, dealr_hand_total) == "Dealer"
    prompt "The Dealer has won."
  else
    prompt "We have a tie!"
  end
end

def display_game_score(plr_hand_total, dealr_hand_total)
  prompt "The final score was:"
  prompt "------> Player: #{plr_hand_total}, Dealer: #{dealr_hand_total}."
end

def five_wins?(plr_scr, dealer_scr)
  !!detect_five_wins(plr_scr, dealer_scr)
end

def detect_five_wins(plr_scr, dealer_scr)
  if plr_scr >= 5
    'Player'
  elsif dealer_scr >= 5
    'Computer'
  end
end

def display_total_score(plr_scr, dealer_scr)
  prompt "The current score is Player: #{plr_scr}, Dealer: #{dealer_scr}."
end

# GAME START
loop do
  system 'clear'
  deck = initialize_deck

  player_cards = []
  dealer_cards = []

  prompt "Welcome to TwentyOne. Think of it like Blackjack without the frills."
  prompt "First to 5 games wins!"
  prompt "Let's Start!"

  press_lowercase_to_continue

  # Initialize deck
  2.times do
    player_cards << deck.delete(deck.sample)
    dealer_cards << deck.delete(deck.sample)
  end

  # Calculating initial hand totals
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  # Player Turn
  answer = nil
  loop do
    display_total_score(player_score, dealer_score)
    prompt "Your current hand is #{player_cards}."
    prompt "------> Value: #{player_total}"
    prompt "The dealer's open card is #{dealer_cards[0]}"
    prompt "Please indicate whether you would like to hit or stay."
    prompt "Press 'h' to hit, 's' to stay."
    answer = gets.chomp.downcase[0]
    system 'clear'
    break if answer == 's' || busted?(player_total)

    if answer == 'h' # commencing 'hit'
      player_cards << deck.delete(deck.sample)
      prompt "You chose to hit!"
      player_total = total(player_cards)
    else
      prompt "Please enter either 'h' or 's'"
    end
  end

  if busted?(player_total)
    prompt "You have busted."
    display_game_score(player_total, dealer_total)
    dealer_score += 1
    display_total_score(player_score, dealer_score)

    play_again? ? next : break
  else
    prompt "You chose to stay!"
  end

  press_lowercase_to_continue

  # Dealer Turn
  prompt "Now it is the dealer's turn."

  loop do
    break if dealer_total >= DEALER_STAY_MIN || busted?(dealer_total)
    dealer_cards << deck.delete(deck.sample)
    dealer_total = total(dealer_cards)
    prompt "The dealer chose to 'hit'."
  end

  if busted?(dealer_total)
    prompt "The dealer has busted."
    display_game_score(player_total, dealer_total)
    player_score += 1
    display_total_score(player_score, dealer_score)

    play_again? ? next : break
  else
    prompt "The dealer chose to stay!"
  end

  # Calculating and outputting who wins.

  press_lowercase_to_continue

  calculate_winner(player_total, dealer_total)
  output_winner(player_total, dealer_total)
  display_game_score(player_total, dealer_total)

  if calculate_winner(player_total, dealer_total) == "Player"
    player_score += 1
  elsif calculate_winner(player_total, dealer_total) == "Dealer"
    dealer_score += 1
  end

  display_total_score(player_score, dealer_score)

  if five_wins?(player_score, dealer_score)
    prompt "#{detect_five_wins(player_score, dealer_score)} won 5 games!"
  end

  break unless play_again?
end

prompt "Thanks for playing. Goodbye!"
