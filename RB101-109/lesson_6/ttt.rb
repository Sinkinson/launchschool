INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def clear_screen
  system 'clear'
end

def prompt(msg)
  puts "=> #{msg}"
end

def alt_prompt(msg)
  puts "--> #{msg}"
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  clear_screen
  puts "You: #{PLAYER_MARKER}. CPU: #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a sqaure (#{joinor(empty_squares(brd))})")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    square = 5 if brd[5] == " "
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
  sleep(1)
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
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def joinor(arr, delimiter= ', ', word= 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def opening_message
  clear_screen
  puts "-----------------------"
  puts "Welcome to Tic Tac Toe"
  puts "-----------------------"
  puts ''
  alt_prompt "Place 3 X's in a row to win the round"
  alt_prompt "First to 5 rounds wins the game"
  puts ''
end

def coin_toss
  puts "Press enter to toss a coin. The winner decides who goes first"
  loop do
    answer = gets.chomp
    break if answer == ''
    puts "Invalid input, just press enter"
  end
  puts "Coin spinning..."
  sleep(1.8)
  toss_winner = ["Player", "Computer"].sample
  puts "#{toss_winner} gets to decide"
  sleep(1)
  toss_winner
end

def player_choice
  choice = ''
  puts "Who would you like to go first? (P)layer or (C)omputer"
  loop do
    answer = gets.chomp.downcase
    if answer.start_with?('p')
      choice = "Player"
    elsif answer.start_with?('c')
      choice = "Computer"
    else
      puts "That's not a valid choice, try again"
    end
    break if choice == "Player" || choice == "Computer"
  end
  puts "You chose #{choice} to start"
  choice
end

def computer_choice
  choice = ["Player", "Computer"].sample
  puts "Computer chose #{choice} to start"
  choice
end

def who_goes_first(coin_toss)
  coin_toss == "Player" ? player_choice : computer_choice
end

def place_piece!(board, current_player)
  if current_player == "Player"
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  current_player == "Player" ? "Computer" : "Player"
end

def game_starter
  puts "Press enter when you are ready to begin"
  loop do
    answer = gets.chomp
    break if answer == ''
    puts "Invalid, input, just press enter"
  end
end

scores = { Player: 0, Computer: 0 }
current_player = ''

loop do
  opening_message
  current_player = who_goes_first(coin_toss)
  game_starter
  clear_screen

  loop do
    board = initialize_board
    display_board(board)

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      if detect_winner(board) == "Player"
        scores[:Player] += 1
      elsif detect_winner(board) == "Computer"
        scores[:Computer] += 1
      end
    else
      prompt "It's a tie!"
    end
    sleep(2)

    if scores[:Player] == 5
      clear_screen
      prompt("Congrats, you won the game")
      break
    elsif scores[:Computer] == 5
      clear_screen
      prompt("Unlucky, the Computer won the game")
      break
    end
  end

  prompt("Play again? (y or n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

clear_screen
prompt "Thanks for playing Tic Tac Toe! Goodbye!"
