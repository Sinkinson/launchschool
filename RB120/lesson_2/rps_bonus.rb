class Move
  MOVES = { 'r' => 'rock',
            'p' => 'paper',
            's' => 'scissors',
            'l' => 'lizard',
            'sp' => 'spock' }

  attr_accessor :name, :beats

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
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def assign_choice(answer)
    choice = answer.size <= 2 ? Move::MOVES[answer] : answer
    choice_const = Object.const_get(choice.capitalize)
    choice_const.new
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, please enter a value"
    end
    self.name = n
  end

  def choose
    answer = nil
    loop do
      puts "\nPlease choose (r)ock, (p)aper, (s)cissors, (l)izard, or (sp)ock"
      answer = gets.chomp
      break if (Move::MOVES.keys + Move::MOVES.values).include?(answer)
      puts "Sorry, invalid choice"
    end
    self.move = assign_choice(answer)
    sleep(1)
  end
end

class Computer < Player
  attr_accessor :cpu, :options

  def set_name
    @cpu = [R2D2.new, Hal.new, Chappie.new, Sonny.new].sample
    self.name = cpu.name
  end

  def choose
    choice = cpu.options.sample
    choice_const = Object.const_get(choice.capitalize)
    self.move = choice_const.new
  end
end

class R2D2 < Computer
  def initialize
    @name = 'R2D2'
    @options = ['rock']
  end
end

class Hal < Computer
  def initialize
    @name = 'Hal'
    @options = ['rock', 'scissors', 'scissors', 'scissors']
  end
end

class Chappie < Computer
  def initialize
    @name = 'Chappie'
    @options = ['lizard', 'spock']
  end
end

class Sonny < Computer
  def initialize
    @name = 'Sonny'
    @options = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  end
end

RULES = <<-MSG
These are the rules of the game:

scissors cuts paper covers rock crushes
lizard posions spock smashes scissors
decapitates lizard eats paper disproves
spock vaporizes rock crushes scissors
MSG

class RPSGame
  attr_accessor :human, :computer, :game_history

  def initialize
    @human = Human.new
    @computer = Computer.new
    @game_history = GameHistory.new
  end

  def clear
    system('clear')
  end

  def display_welcome_message
    puts "\nHi #{human.name}!"
    sleep(1.3)
    puts "Welcome to rock, paper, scissors, lizard, spock."
    puts RULES
  end

  def display_goodbye_message
    puts "Thanks for playing rock, paper, scissors, lizard, spock."
  end

  def display_score(str)
    sleep(2)
    clear
    puts "\n--| #{str} SCORE |--"
    puts "\n#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
    sleep(1.5)
  end

  def display_moves
    clear
    puts "\n#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
    game_history.add_game(human.move, computer.move)
    puts
    sleep(1.4)
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won"
      human.score += 1
    elsif computer.move > human.move
      puts "#{computer.name} won"
      computer.score += 1
    else
      puts "It's a tie"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "\nWould you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be y or n"
    end
    return true if answer.downcase == 'y'
    return false if answer.downcase == 'n'
  end

  def game_starter
    puts "\nPress enter key when you are ready to start"
    loop do
      answer = gets.chomp
      break if answer == ''
      puts "Just press enter"
    end
    clear
  end

  def game_won?
    human.score == 3 || computer.score == 3
  end

  def wipe_scores
    human.score = 0
    computer.score = 0
    game_history.record.clear
  end

  def display_game_winner
    if human.score == 3
      puts "** YOU WON **"
    else
      puts "Hard luck, #{computer.name} won"
    end
  end

  def display_game_history?
    answer = ''
    puts "\nWould you like to see the game history? (y/n)"
    loop do
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Invalid input, please just enter 'y' or 'n'"
    end
    game_history.display_games if answer == 'y'
  end

  def play_individual_game
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break if game_won?
      display_score('CURRENT')
      display_game_history?
    end
  end

  def play
    display_welcome_message
    game_starter
    loop do
      wipe_scores
      play_individual_game
      display_game_winner
      display_score('FINAL')
      break unless play_again?
    end
    display_goodbye_message
  end
end

class GameHistory
  attr_reader :record

  def initialize
    @record = []
  end

  def add_game(human_move, comp_move)
    record << [human_move.name, comp_move.name]
  end

  def display_games
    record.each_with_index do |moves, idx|
      puts "\nRound #{idx + 1}"
      puts "You chose: #{moves.first}"
      puts "Computer chose: #{moves.last}"
    end
  end
end

RPSGame.new.play
