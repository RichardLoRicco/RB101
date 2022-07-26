=begin
FLOW OF GAME
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.
=end

POINT_LIMIT = 21



def prompt(msg)
  puts "=> #{msg}"
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

def busted?(cards)
  total(cards) > POINT_LIMIT
end

def press_lowercase_to_continue
  loop do
    prompt "Press any lowercase key and hit enter to proceed."
  answer = gets.chomp[0]
    if answer == answer.downcase
      system 'clear'
      break
    end
  end
end

def calculate_winner(plr_hand, dealr_hand)
  if total(plr_hand) > total(dealr_hand)
    "Player"
  elsif total(plr_hand) < total(dealr_hand)
    "Dealer"
  else
    "Tie"
  end
end

def output_winner(plr_hand, dealr_hand)
  if calculate_winner(plr_hand, dealr_hand) == "Player"
    prompt "Player has won."
  elsif calculate_winner(plr_hand, dealr_hand) == "Dealer" 
    prompt "The Dealer has won."
  else
    prompt "We have a tie!"
  end
end

def display_final_score(plr_hand, dealr_hand)
  prompt "The final score was Player: #{total(plr_hand)}, Dealer: #{total(dealr_hand)}."
end 

# GAME START
loop do
  system 'clear'
  deck = [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], 
          ['H', 'J'], ['H', 'Q'], ['H', 'K'], ['H', 'A'],
          ['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], 
          ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C', 'A'],
          ['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], 
          ['S', 'J'], ['S', 'Q'], ['S', 'K'], ['S', 'A'],
          ['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], 
          ['D', 'J'], ['D', 'Q'], ['D', 'K'], ['D', 'A']]

  player_cards = []
  dealer_cards = []

  prompt "Welcome to TwentyOne. Think of it like Blackjack without the frills. Let's Start!"

  # Initialize deck 
  player_cards << deck.delete(deck.sample)
  player_cards << deck.delete(deck.sample)
  dealer_cards << deck.delete(deck.sample)
  dealer_cards << deck.delete(deck.sample)

  # Player Turn
  answer = nil
  loop do
    prompt "Your current hand is #{player_cards}. The dealer's open card is #{dealer_cards[0]}"
    prompt "Please indicate whether you would like to hit or stay?"
    prompt "Press 'h' if you would like to hit. Press 's' if you would like to stay."
    answer = gets.chomp.downcase[0]
    system 'clear'
    break if answer == 's' || busted?(player_cards)

    # commencing 'hit'
    player_cards << deck.delete(deck.sample)
  end

  if busted?(player_cards)
    prompt "You have busted. Dealer has won."
    prompt "Would you like to play again? Press 'y' if yes, 'n' if no."
    answer = gets.chomp.downcase[0]
    break if answer == 'n'
    next
  else
    prompt "You chose to stay!"
  end

  press_lowercase_to_continue

  # Dealer Turn
  prompt "Now it is the dealer's turn."

  loop do
    break if total(dealer_cards) >= 17 || busted?(dealer_cards)
    dealer_cards << deck.delete(deck.sample)
    prompt "The dealer chose to 'hit'."
  end

  if busted?(dealer_cards)
    prompt "The dealer has busted. You have won"
    prompt "Would you like to play again? Press 'y' if yes, 'n' if no."
    answer = gets.chomp.downcase[0]
    break if answer == 'n'
    next
  else
    prompt "The dealer chose to stay!"
  end

  # Calculating and outputting who wins.

  press_lowercase_to_continue

  calculate_winner(player_cards, dealer_cards)
  output_winner(player_cards, dealer_cards)
  display_final_score(player_cards, dealer_cards)

  loop do
    prompt "Would you like to play again? Press 'y' if yes, 'n' if no."
    answer = gets.chomp.downcase[0]
    break if answer == 'n'
    next
  end

end