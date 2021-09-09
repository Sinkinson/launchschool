RULES = ['scissors cuts paper', 'paper covers rock',
         'rock crushes lizard', 'lizard posions spock',
         'spock smashes scissors', 'scissors decapitates lizard',
         'lizard eats paper', 'paper disproves spock',
         'spock vaporizes rock', 'rock crushes scissors']

MOVES = { 'r' => 'rock',
          'p' => 'paper',
          's' => 'scissors',
          'l' => 'lizard',
          'sp' => 'spock' }

CPU = { 'T' => 'Terminator',
        'H' => 'Hal',
        'C' => 'Chappie',
        'S' => 'Sonny' }

MAX_WINS = 5

module Styleable
  def clear
    system('clear') || system('cls')
  end

  def break_line
    puts '------------------------------------------------'
  end

  def pause(msg)
    sleep(0.5)
    print msg
  end
end

module Questionable
  ANSWER_OPTIONS = ['y', 'n', 'yes', 'no']

  def yes_no_question(question)
    answer = ''
    puts question
    break_line
    loop do
      answer = gets.chomp.strip
      break if ANSWER_OPTIONS.include?(answer)
      puts "Please just enter one of the following options: #{ANSWER_OPTIONS}"
    end
    answer == 'y' || answer == 'yes'
  end
end

module Displayable
  include Questionable
  include Styleable

  def display_loading_message
    clear
    print "Loading game"
    pause('.')
    pause('.')
    pause('.')
    pause('.')
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock"
  end

  def display_opening_messages
    display_loading_message
    clear
    display_welcome_message
    break_line
    display_rules?
  end

  def display_rules?
    if yes_no_question("Would you like to see the rules? (y/n)")
      show_rules
    else
      break_line
    end
  end

  def show_rules
    break_line
    RULES.each do |rule|
      puts "-> #{rule}"
      sleep(0.3)
    end
    break_line
  end

  def display_results
    puts "\n#{human} chose: #{human.move}"
    puts "#{computer} chose: #{computer.move}"
    sleep(1.5)
  end

  def display_opponent_choice
    clear
    break_line
    puts "You are playing: #{computer}"
    puts "First to #{MAX_WINS} wins, good luck"
    break_line
  end

  def display_and_record_results
    display_results
    display_winner
    history.add_game(human.move, computer.move)
    record_game_result
  end

  def display_score_banner(num)
    puts '-' * num
    puts 'SCOREBOARD'.center(num)
    puts '-' * num
  end

  # rubocop:disable Metrics/AbcSize
  def display_score
    human_score = "#{human.name}: #{human.score}"
    computer_score = "#{computer.name}: #{computer.score}"
    length = ((human_score.size + computer_score.size) + 2)
    display_score_banner(length)
    puts "\n" + human_score + '  ' + \
         computer_score.rjust(human_score.size - length) + "\n"
  end
  # rubocop:enable Metrics/AbcSize

  def display_winner
    puts
    if human.move > computer.move then puts "#{human} won"
    elsif computer.move > human.move then puts "#{computer} won"
    else puts "It's a tie"
    end
    sleep(1.8)
  end

  def display_game_history_banner
    break_line
    puts "GAME HISTORY".center(48)
    break_line
    puts "Round No".ljust(12) + "You".ljust(12) + "CPU".ljust(12) + "Result"
    break_line
  end

  def display_goodbye_message
    break_line
    puts "Thanks for playing. Goodbye"
  end
end

class Move
  attr_accessor :beats, :name

  def >(other_move)
    beats.include?(other_move.name)
  end

  def to_s
    @name
  end
end

class Rock < Move
  def initialize
    @name = 'rock'
    @beats = ['scissors', 'lizard']
  end
end

class Paper < Move
  def initialize
    @name = 'paper'
    @beats = ['rock', 'spock']
  end
end

class Scissors < Move
  def initialize
    @name = 'scissors'
    @beats = ['paper', 'lizard']
  end
end

class Lizard < Move
  def initialize
    @name = 'lizard'
    @beats = ['spock', 'paper']
  end
end

class Spock < Move
  def initialize
    @name = 'spock'
    @beats = ['scissors', 'rock']
  end
end

class Player
  attr_accessor :name, :move, :score

  def initialize
    @score = 0
  end

  def assign_choice(answer)
    choice = answer.size <= 2 ? MOVES[answer] : answer
    Object.const_get(choice.capitalize).new
  end

  def to_s
    @name
  end
end

class Human < Player
  def users_name
    puts "Whats your name?"
    answer = ''
    loop do
      answer = gets.chomp.strip
      break unless answer.empty?
      puts "Please enter a name"
    end
    self.name = answer.capitalize
  end

  def choose
    answer = nil
    loop do
      puts "Please choose: (r)ock, (p)aper, (s)cissors, (l)izard, or (sp)ock"
      answer = gets.chomp.strip
      break if (MOVES.keys + MOVES.values).include?(answer)
      puts "Sorry, invalid choice"
    end
    self.move = assign_choice(answer)
  end
end

class Computer < Player
  attr_accessor :cpu, :moves

  def choose_computer(value)
    value.size == 1 ? value = CPU[value] : value
    self.cpu = Object.const_get(value).new
    self.name = cpu.name
  end

  def choose
    choice = cpu.moves.sample
    self.move = Object.const_get(choice).new
  end
end

class Terminator < Computer
  def initialize
    @name = 'Terminator'
    @moves = ['Rock']
  end
end

class Hal < Computer
  def initialize
    @name = 'Hal'
    @moves = ['Rock', 'Scissors', 'Scissors', 'Scissors']
  end
end

class Chappie < Computer
  def initialize
    @name = 'Chappie'
    @moves = ['Lizard', 'Spock']
  end
end

class Sonny < Computer
  def initialize
    @name = 'Sonny'
    @moves = ['Rock', 'Paper', 'Scissors', 'Lizard', 'Spock']
  end
end

class History
  include Styleable
  include Displayable

  attr_accessor :record

  def initialize
    @record = { human: [], computer: [], result: [] }
  end

  def add_game(human_move, comp_move)
    record[:human] << human_move.name.to_s
    record[:computer] << comp_move.name.to_s
  end

  def add_game_result(outcome)
    record[:result] << outcome
  end

  def show_record
    clear
    display_game_history_banner
    display_game_history
  end

  # rubocop:disable Metrics/AbcSize
  def display_game_history
    n = 0
    loop do
      puts "Round #{n + 1}".ljust(12) + record[:human][n].ljust(12) \
      + record[:computer][n].ljust(12) + record[:result][n]
      n += 1
      break if n == record[:result].size
    end
    break_line
  end
  # rubocop:enable Metrics/AbcSize
end

class RPSGame
  include Displayable
  include Questionable

  attr_accessor :human, :computer, :history

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = History.new
  end

  def play
    display_opening_messages
    human.users_name
    main_game_loop
    display_goodbye_message
  end

  def main_game_loop
    loop do
      reset_scores
      choose_opponent?
      display_opponent_choice
      game_starter
      play_individual_game
      show_champion
      show_history?
      break unless play_again?
    end
  end

  def play_individual_game
    loop do
      clear
      display_score
      human.choose
      computer.choose
      display_and_record_results
      break if game_won?
    end
  end

  def reset_scores
    human.score = 0
    computer.score = 0
    history.record[:human].clear
    history.record[:computer].clear
    history.record[:result].clear
  end

  def play_again?
    yes_no_question("Would you like to play again? (y/n)")
  end

  def show_history?
    break_line
    unless yes_no_question("View game history? (y/n)"); return; end
    history.show_record
  end

  def game_starter
    puts "Press enter when you are ready to start the game"
    loop do
      answer = gets.chomp
      break if answer == ''
      puts "Invalid input, just press enter"
    end
  end

  def show_champion
    clear
    if human.score == MAX_WINS
      puts "~*~ YOU'RE THE CHAMPION ~*~"
    else
      puts "Hard luck, #{computer} is the champion"
    end
    puts "\nThe final score was:"
    display_score
  end

  def game_won?
    human.score == MAX_WINS || computer.score == MAX_WINS
  end

  # rubocop:disable Metrics/AbcSize
  def record_game_result
    if human.move > computer.move
      history.add_game_result('won')
      human.score += 1
    elsif computer.move > human.move
      history.add_game_result('lost')
      computer.score += 1
    else
      history.add_game_result('tied')
    end
  end
  # rubocop:enable Metrics/AbcSize

  def choose_opponent?
    clear
    break_line
    puts "Hi #{human}!"
    break_line
    if yes_no_question("Would you like to choose your opponent? (y/n)")
      clear
      computer_options
    else
      computer.choose_computer(CPU.keys.sample)
    end
  end

  def computer_options
    answer = ''
    loop do
      puts "These are your options: (T)erminator, (H)al, (C)happie or (S)onny"
      answer = gets.chomp.capitalize
      break if (CPU.keys + CPU.values).include?(answer)
      puts "Invalid input. Please try again"
    end
    computer.choose_computer(answer)
  end
end

RPSGame.new.play
