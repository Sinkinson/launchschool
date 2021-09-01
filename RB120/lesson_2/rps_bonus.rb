class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
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
    choice = nil
    loop do
      puts "\nPlease choose rock, paper, scissors, lizard, or spock"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice"
    end
    self.move = class_chooser(choice)
    sleep(1)
  end
end

def class_chooser(choice)
  case choice
  when 'rock' then Rock.new
  when 'paper' then Paper.new
  when 'scissors' then Scissors.new
  when 'lizard' then Lizard.new
  when 'spock' then Spock.new
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = [Rock.new, 
                 Paper.new, 
                 Scissors.new,
                 Lizard.new,
                 Spock.new].sample
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
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
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
    puts "\n--| #{str} SCORE |--"
    puts "\n#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
    sleep(3)
    clear
  end

  def display_moves
    puts "\n#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
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
    sleep(2)
    clear
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
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
    return true if human.score == 3 || computer.score == 3
  end

  def wipe_scores
    human.score = 0
    computer.score = 0
  end

  def display_game_winner(str)
    if human.score == 3
      puts "** YOU WON **"
      puts
      display_score(str)
    else
      puts "Hard luck, #{computer.name} won"
      puts
      display_score(str)
    end
  end

  def play
    display_welcome_message
    game_starter
    loop do
      wipe_scores
      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        break if game_won?
        display_score('CURRENT')
      end
      display_game_winner('FINAL')
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
