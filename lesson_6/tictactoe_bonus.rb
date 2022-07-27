WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
GAMES_TO_WIN = 5

player_score = 0
computer_score = 0

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/AbcSize
# rubocop: disable Metrics/MethodLength
def display_board(brd)
  system 'clear'
  puts "First to 5 games wins."
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}   "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts ""
end
# rubocop: enable Metrics/AbcSize
# rubocop: enable Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, punctuation = ', ', conjunction = "or")
  case arr.size
  when 0
    ''
  when 1
    arr
  when 2
    arr.join(" #{conjunction} ")
  else
    arr[-1] = "#{conjunction} #{arr.last}"
    arr.join(punctuation.to_s)
  end
end

def player_prompt_first_move
  first_move = ""
  loop do
    prompt "Please indicate if you would like to play first."
    prompt "Enter 'y' if yes and 'n' if you will let the Computer decide."
    first_move = gets.chomp.downcase
    break if first_move.start_with?('y') || first_move.start_with?('n')
    prompt "Incorrect response. Please enter 'y' or 'n'."
  end
  first_move
end

def player_first_move?
  answer = player_prompt_first_move
  computer_first_move_selection = [true, false].sample

  if answer.start_with?('y')
    true
  else
    computer_first_move_selection
  end
end

def display_score(plyr_scr, comp_scr)
  prompt "The current score is Player: #{plyr_scr}, Computer: #{comp_scr}."
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

# rubocop: disable Style/EmptyElse
# rubocop: disable Layout/LineLength
def defensive_square(line, board)
  if board.values_at(*line).count(PLAYER_MARKER) == 2
    board.select { |key, value| line.include?(key) && value == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def offensive_square(line, board)
  if board.values_at(*line).count(COMPUTER_MARKER) == 2
    board.select { |key, value| line.include?(key) && value == INITIAL_MARKER }.keys.first
  else
    nil
  end
end
# rubocop: enable Style/EmptyElse
# rubocop: enable Layout/LineLength

# rubocop: disable Metrics/CyclomaticComplexity
# rubocop: disable Metrics/MethodLength
def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = offensive_square(line, brd)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = defensive_square(line, brd)
      break if square
    end
  end

  if !square && empty_squares(brd).include?(5)
    square = 5
  end

  if !square
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end
# rubocop: enable Metrics/CyclomaticComplexity
# rubocop: enable Metrics/MethodLength

def place_piece!(brd, plr)
  if plr == "Player"
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(plr)
  if plr == "Player"
    "Computer"
  else
    "Player"
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def five_wins?(plyr_scr, comp_scr)
  !!detect_five_wins(plyr_scr, comp_scr)
end

def detect_five_wins(plyr_scr, comp_scr)
  if plyr_scr >= GAMES_TO_WIN
    'Player'
  elsif comp_scr >= GAMES_TO_WIN
    'Computer'
  end
end

loop do
  board = initialize_board
  display_board(board)

  first_mover = player_first_move? ? "Player" : "Computer"

  current_player = first_mover
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    if detect_winner(board) == 'Player'
      player_score += 1
    else
      computer_score += 1
    end
  else
    prompt "It's a tie!"
  end

  display_score(player_score, computer_score)

  if five_wins?(player_score, computer_score)
    prompt "#{detect_five_wins(player_score, computer_score)} won 5 games!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
