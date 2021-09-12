require 'pry'

module Formattable
  def clear
    system "clear"
  end

  def break_line(size)
    puts '-' * size
  end

  def loading
    puts '.'
    sleep(0.5)
    puts '..'
    sleep(0.5)
    puts '...'
    sleep(0.2)
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

module Displayable
  include Formattable

  def display_welcome_message
    break_line(23)
    puts "Welcome to Tic Tac Toe!"
    break_line(23)
    puts "-> Your symbol: #{human.marker}"
    puts "-> Computer symbol: #{computer.marker}\n"
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
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

  def two_squares_taken?(markers, player_mark)
    markers.count(player_mark) == 2 && markers.count(" ") == 1
  end

  def get_markers(line)
    @squares.values_at(*line).map(&:marker)
  end

  def move_possible?(player_marker)
    WINNING_LINES.each do |line|
      if two_squares_taken?(get_markers(line), player_marker)
        return true
      end
    end
    false
  end

  def find_empty_square(player_marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if two_squares_taken?(get_markers(line), player_marker)
        empty_square = squares.select(&:unmarked?)[0]
        return @squares.key(empty_square)
      end
    end
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
  attr_accessor :score

  def initialize(marker)
    @marker = marker
    @score = 0
  end
end

class TTTGame
  include Displayable
  include Formattable

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
    clear
    display_welcome_message
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

  def set_first_to_move(marker)
    FIRST_TO_MOVE.replace(marker)
    sleep(2)
  end

  YES_NO_OPTIONS = ['yes', 'no', 'y', 'n']

  def yes_no_question(question)
    puts question
    answer = ''
    loop do
      answer = gets.chomp.downcase
      break if YES_NO_OPTIONS.include? answer
      puts "Please just enter one of the following options: #{YES_NO_OPTIONS}"
    end
    answer == 'y' || answer == 'yes'
  end

  def player_chooses_first_mover
    if yes_no_question("Would you like to make the first move? (y/n)")
      set_first_to_move(HUMAN_MARKER)
    else
      set_first_to_move(COMPUTER_MARKER)
    end
  end

  def player_chooses_first_mover
    answer = ''
    puts "Would you like to make the first move? (y/n)"
    loop do
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Please just enter y or n"
    end
    choice = answer == 'n' ? COMPUTER_MARKER : HUMAN_MARKER
    set_first_to_move(choice)
  end

  def choose_first_mover
    answer = ''
    puts "Do you want to decide who starts the game? (y/n)"
    loop do
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Please just enter y or n"
    end
    if answer == 'y'
      player_chooses_first_mover
    else
      computer_chooses_first_mover
    end
  end

  def computer_chooses_first_mover
    clear
    puts "Computer deciding"
    loading
    computer_choice = [COMPUTER_MARKER, HUMAN_MARKER].sample
    if computer_choice == HUMAN_MARKER
      puts "Computer has chosen you to go first"
    else
      puts "Computer wants to make the first move"
    end
    set_first_to_move(computer_choice)
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

  def display_score
    break_line(17)
    puts "SCOREBOARD".center(17)
    break_line(17)
    puts "You: #{human.score} Computer: #{computer.score}", ''
  end

  def game_starter
    puts "\nPress enter when you are ready to start the game"
    STDIN.gets
  end

  def game_won?
    human.score == 3 || computer.score == 3
  end

  def display_champion
    if human.score == 3
      puts "~*~ YOU ARE THE CHAMPION ~*~"
    else
      puts "Hard luck, computer is the champion"
    end
  end

  def next_round
    puts "Press enter to start the next round"
    STDIN.gets
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = human.marker
  end

  def computer_moves
    if board.move_possible?(COMPUTER_MARKER)
      attack!
    elsif board.move_possible?(HUMAN_MARKER)
      defend!
    elsif board[5] == Square::INITIAL_MARKER
      board[5] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def attack!
    square = board.find_empty_square(COMPUTER_MARKER)
    board[square] = computer.marker
  end

  def defend!
    square = board.find_empty_square(HUMAN_MARKER)
    board[square] = computer.marker
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
