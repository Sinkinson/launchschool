# In the previous exercise, you wrote a number guessing game that determines a secret number between 1 and 100,
# and gives the user 7 opportunities to guess the number.

# Update your solution to accept a low and high value when you create a GuessingGame object, and use those values
# to compute a secret number for the game. You should also change the number of guesses allowed so the user can
# always win if she uses a good strategy. You can compute the number of guesses with:

class GuessingGame
  def initialize(low, high)
    @range = (low..high)
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
    @target = rand(@range)
    @count = Math.log2(size_of_range).to_i + 1
  end

  def size_of_range
    @range.last - @range.first
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
    print "Enter a number between #{@range.first} and #{@range.last}: "
    loop do
      answer = gets.chomp
      return answer.to_i if valid_integer?(answer)
      print "\nInvalid guess. Enter a number between #{@range.first} and #{@range.last}: "
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
    @range.cover?(num.to_i) && num.to_i.to_s == num
  end
end

game = GuessingGame.new(501, 1500)
game.play

# LS solution

class GuessingGame
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

  def initialize(low, high)
    @range = low..high
    @max_guesses = Math.log2(high - low + 1).to_i + 1
    @secret_number = nil
  end

  def play
    reset
    game_result = play_game
    display_game_end_message(game_result)
  end

  private

  def reset
    @secret_number = rand(@range)
  end

  def play_game
    result = nil
    @max_guesses.downto(1) do |remaining_guesses|
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
      print "Enter a number between #{@range.first} and #{@range.last}: "
      guess = gets.chomp.to_i
      return guess if @range.cover?(guess)
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
