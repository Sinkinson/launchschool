module Minimax
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def find_best_move(board, player)
    best_score = -1000
    best_move = board.unmarked_keys.sample
    board.unmarked_keys.each do |position|
      board[position] = TTTGame::COMPUTER_MARKER
      score = min_max(board, player, 0)
      board[position] = " "
      if score > best_score
        best_score = score
        best_move = position
      end
    end
    best_move
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def min_max(board, player, depth)
    return score(board) if board.someone_won? || board.full?
    scores = []

    if player == :Maxi
      board.unmarked_keys.each do |move|
        board[move] = TTTGame::COMPUTER_MARKER
        score = min_max(board, :Mini, depth + 1)
        scores << score
        board[move] = " "
      end
    elsif player == :Mini
      board.unmarked_keys.each do |move|
        board[move] = TTTGame::HUMAN_MARKER
        score = min_max(board, :Maxi, depth + 1)
        scores << score
        board[move] = " "
      end
    end

    player == :Maxi ? scores.max - depth : scores.min + depth
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def score(board)
    case board.winning_marker
    when TTTGame::HUMAN_MARKER then -100
    when TTTGame::COMPUTER_MARKER then 100
    else 0
    end
  end
end

module Formattable
  def clear
    system "clear"
  end

  def loading
    puts '.'
    sleep(0.5)
    puts '..'
    sleep(0.5)
    puts '...'
    sleep(0.5)
  end

  def break_line(msg)
    size = msg.size
    puts '-' * size
    puts msg
    puts '-' * size
  end

  def joinor(arr, delimiter=', ', word='or')
    case arr.size
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimiter)
    end
  end
end

module Questionable
  YES_NO_OPTIONS = ['yes', 'no', 'y', 'n']

  def yes?(question)
    puts '', question
    answer = ''
    loop do
      answer = gets.chomp.downcase
      break if YES_NO_OPTIONS.include? answer
      puts "Please just enter one of the following options: #{YES_NO_OPTIONS}"
    end
    answer == 'y' || answer == 'yes'
  end
end

module Displayable
  include Formattable

  def display_welcome_message
    break_line("Welcome to Tic Tac Toe!")
    puts "Your Marker     --> #{human.marker}"
    puts "Computer Marker --> #{computer.marker}\n"
  end

  def display_goodbye_message
    puts "Thanks for playing!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    display_score
    board.draw
    puts ""
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker then puts "You won!"
    when computer.marker then puts "Computer won!"
    else puts "It's a tie!"
    end
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def display_computer_choosing
    clear
    puts "#{computer.name} deciding who moves first"
    loading
  end

  def display_computer_choice(computer_choice)
    if computer_choice == TTTGame::HUMAN_MARKER
      break_line("YOU WILL GO FIRST")
    else
      break_line("#{computer.name.upcase} WILL GO FIRST")
    end
    game_starter
  end

  def display_score
    break_line("SCOREBOARD".center(17))
    puts "You: #{human.score} Computer: #{computer.score}", ''
  end

  def display_champion
    if human.score == 3
      break_line("~*~ YOU ARE THE CHAMPION ~*~")
    else
      break_line("Unlucky, #{computer.name} is the champion")
    end
  end

  def display_opening_messages
    clear
    display_welcome_message
    display_amount_to_win
    choose_marker_type
    define_names
    display_names
  end

  def display_amount_to_win
    break_line("You need to win 3 games to become champion")
  end

  def display_names
    clear
    puts "Hi #{human.name}! You are going to play #{computer.name}"
    sleep(2.5)
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def [](num)
    @squares[num].marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  attr_accessor :score, :name

  def initialize(marker)
    @marker = marker
    @score = 0
  end
end

class TTTGame
  include Minimax
  include Displayable
  include Formattable
  include Questionable

  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = ''

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    display_opening_messages
    loop do
      reset_score
      choose_first_mover
      main_game
      display_champion
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def define_names
    clear
    ask_for_users_name
    computer.name = ['Wall-E', 'Terminator', 'Spark'].sample
  end

  def ask_for_users_name
    puts "What's your name?"
    answer = ''
    loop do
      answer = gets.chomp.strip
      break unless answer.empty?
      puts "Please enter a name"
    end
    human.name = answer.capitalize
  end

  def choose_marker_type
    unless yes?("Would you like to choose your own marker? (y/n)"); return; end
    clear
    break_line("Please enter any single alphabetic character, except O")
    marker_type_answer
  end

  def marker_type_answer
    answer = ''
    loop do
      answer = gets.chomp.upcase
      alpha = ('A'..'N').to_a + ('P'..'Z').to_a
      break if alpha.include? answer
      puts "Invalid input, try again"
    end
    change_marker_type(answer)
  end

  def change_marker_type(choice)
    HUMAN_MARKER.replace(choice)
  end

  def game_starter
    puts "Press enter to start the game"
    STDIN.gets
  end

  def change_first_to_move(marker)
    FIRST_TO_MOVE.replace(marker)
  end

  def choose_first_mover
    clear
    if yes?("Do you want to decide who starts the game? (y/n)")
      player_chooses_first_mover
    else
      computer_chooses_first_mover
    end
  end

  def player_chooses_first_mover
    if yes?("To go 1st type --> y \nTo go 2nd type --> n")
      change_first_to_move(HUMAN_MARKER)
    else
      change_first_to_move(COMPUTER_MARKER)
    end
  end

  def computer_chooses_first_mover
    display_computer_choosing
    computer_choice = [COMPUTER_MARKER, HUMAN_MARKER].sample
    display_computer_choice(computer_choice)
    change_first_to_move(computer_choice)
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def main_game
    loop do
      reset
      display_board
      player_move
      display_result
      record_score
      break if game_won?
      next_round
      display_play_again_message
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def game_won?
    human.score == 3 || computer.score == 3
  end

  def next_round
    break_line("Press enter to start the next round")
    STDIN.gets
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp
      square = valid_integer(square)
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = human.marker
  end

  def valid_integer(square)
    square.to_i.to_s == square ? square.to_i : nil
  end

  def computer_moves
    if board[5] == Square::INITIAL_MARKER
      board[5] = computer.marker
    else
      move = find_best_move(@board, :Mini)
      board[move] = computer.marker
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end
    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def record_score
    case board.winning_marker
    when human.marker then human.score += 1
    when computer.marker then computer.score += 1
    end
  end
end

game = TTTGame.new
game.play
