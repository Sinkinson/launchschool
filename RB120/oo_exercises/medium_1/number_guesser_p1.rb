# Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game.
# The game should play like this:

# game = GuessingGame.new
# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!

# Note that a game object should start a new game with a new number to guess with each call to #play.

class GuessingGame
  def initialize
    @target = nil
    @count = nil
  end

  def play
    set_variables
    loop do
      guesses_remaining
      number = guess_a_number
      reduce_guesses
      result = check(number)
      break if result == :on_target || no_guesses_left
      high_or_low(result)
    end
    display_result
  end

  private

  attr_reader :count

  def set_variables
    @target = rand(1..100)
    @count = 7
  end

  def no_guesses_left
    @count == 0
  end

  def high_or_low(result)
    case result
    when :high then puts "Your guess is too high."
    when :low then puts "Your guess is too low."
    end
  end

  def display_result
    if no_guesses_left
      puts "You have no more guesses. You lost!"
    else
      puts "That's the number!"
    end
  end

  def guesses_remaining
    puts '', "You have #{count} guesses remaining."
  end

  def guess_a_number
    print "Enter a number between 1 and 100: "
    loop do
      answer = gets.chomp
      return answer.to_i if valid_integer?(answer)
      print "\nInvalid guess. Enter a number between 1 and 100: "
    end
  end

  def check(num)
    if num > @target
      :high
    elsif num < @target
      :low
    else
      :on_target
    end
  end

  def reduce_guesses
    @count -= 1
  end

  def valid_integer?(num)
    (1..100).include?(num.to_i) && num.to_i.to_s == num
  end
end

game = GuessingGame.new
game.play

# LS solution

class GuessingGame
  MAX_GUESSES = 7
  RANGE = 1..100

  RESULT_OF_GUESS_MESSAGE = {
    high:  "Your number is too high.",
    low:   "Your number is too low.",
    match: "That's the number!"
  }.freeze

  WIN_OR_LOSE = {
    high:  :lose,
    low:   :lose,
    match: :win
  }.freeze

  RESULT_OF_GAME_MESSAGE = {
    win:  "You won!",
    lose: "You have no more guesses. You lost!"
  }.freeze

  def initialize
    @secret_number = nil
  end

  def play
    reset
    game_result = play_game
    display_game_end_message(game_result)
  end

  private

  def reset
    @secret_number = rand(RANGE)
  end

  def play_game
    result = nil
    MAX_GUESSES.downto(1) do |remaining_guesses|
      display_guesses_remaining(remaining_guesses)
      result = check_guess(obtain_one_guess)
      puts RESULT_OF_GUESS_MESSAGE[result]
      break if result == :match
    end
    WIN_OR_LOSE[result]
  end

  def display_guesses_remaining(remaining)
    puts
    if remaining == 1
      puts 'You have 1 guess remaining.'
    else
      puts "You have #{remaining} guesses remaining."
    end
  end

  def obtain_one_guess
    loop do
      print "Enter a number between #{RANGE.first} and #{RANGE.last}: "
      guess = gets.chomp.to_i
      return guess if RANGE.cover?(guess)
      print "Invalid guess. "
    end
  end

  def check_guess(guess_value)
    return :match if guess_value == @secret_number
    return :low if guess_value < @secret_number
    :high
  end

  def display_game_end_message(result)
    puts "", RESULT_OF_GAME_MESSAGE[result]
  end
end

=begin

- The hashes at the beginning allow for easier reading
- It's good practice to initialize instance variables within the initialize method, as it provides a single point where you
  can see all of them
- A symbol is returned as the game result which is then used to provide the end message

=end
