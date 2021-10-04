module Formattable
  OPTIONS = ['y', 'n', 'yes', 'no']

  def clear
    system('clear') || system('cls')
  end

  def break_line(msg)
    puts '-' * msg.size
    puts msg
    puts '-' * msg.size
  end

  def game_starter
    puts '', "Press enter to start the game"
    STDIN.gets
  end

  def yes_no?(question)
    puts question
    answer = ''
    loop do
      answer = gets.chomp.downcase
      break if OPTIONS.include?(answer)
      puts "Please enter one of the following options: #{OPTIONS}"
    end
    answer == 'y' || answer == 'yes'
  end
end

module Displayable
  include Formattable

  def display_welcome_message
    clear
    break_line("Welcome to the game of 21")
    display_rules if yes_no?("Would you like to see the rules? (y/n)")
    game_starter
  end

  def display_rules
    puts '-' * 52
    puts "Aim to get a total as close to 21 without going over"
    puts "\nThere are only two playable options"
    puts " -> Hit: recieve another card"
    puts " -> Stick: keep your current cards"
    puts '-' * 52
  end

  def display_dealing_msg
    clear
    puts "Dealing"
    print '.'
    sleep(0.4)
    print '.'
    sleep(0.4)
    print '.'
    sleep(0.4)
    print '.'
  end

  def display_cards(hidden)
    clear
    display_dealer_hand(hidden)
    display_player_hand
  end

  def display_dealer_hand(hidden)
    puts "Dealer"
    hidden ? display_hidden_hand : display_normal_hand(dealer)
  end

  def display_player_hand
    puts '', "Player"
    display_normal_hand(player)
    puts '', "Player total: #{player.total}"
  end

  def display_normal_hand(user)
    cards = format_cards(user)
    display_picture(cards)
  end

  def format_cards(user)
    user.cards.map { |card| card.rank.to_s + card.suit }
  end

  # rubocop:disable Metrics/AbcSize
  def display_hidden_hand
    cards = format_cards(dealer)[0...-1]
    puts cards.map { |card| '+' + '-' * card.size + '+' }.join(' ') + ' +---+'
    puts cards.map { |card| '|' + card + '|' }.join(' ') + ' | ? |'
    puts cards.map { |card| '+' + '-' * card.size + '+' }.join(' ') + ' +---+'
  end

  def display_picture(cards)
    puts cards.map { |card| '+' + '-' * card.size + '+' }.join(' ')
    puts cards.map { |card| '|' + card + '|' }.join(' ')
    puts cards.map { |card| '+' + '-' * card.size + '+' }.join(' ')
  end
  # rubocop:enable Metrics/AbcSize

  def display_dealer_total
    puts "Dealer total: #{dealer.total}"
  end

  def display_outcomes
    if player.busted?
      break_line("You went bust, dealer wins")
    elsif dealer.busted?
      break_line("Dealer went bust, you win")
    else
      display_total_comparisons
    end
  end

  def display_total_comparisons
    if dealer > player
      break_line("Dealer closer to 21, dealer wins")
    elsif player > dealer
      break_line("You are closer to 21, you win")
    else
      break_line("It's a tie")
    end
  end
end

class Participant
  include Displayable
  BUST_LIMIT = 21

  attr_accessor :cards, :name

  def initialize
    @cards = []
  end

  def hit(deck)
    @cards << deck.cards.pop
  end

  def stick
    clear
    puts "Dealers turn!"
    sleep(1.5)
    display_dealing_msg
  end

  def busted?
    total > BUST_LIMIT
  end

  def total
    ace_convertor(rank_convertor).sum
  end

  def >(other)
    total > other.total
  end

  private

  def rank_convertor
    @cards.map do |card|
      case card.rank
      when 'J', 'Q', 'K' then 10
      when 'A' then 11
      else card.rank
      end
    end
  end

  def ace_convertor(cards)
    cards.map { |card| card == 11 && cards.sum > BUST_LIMIT ? 1 : card }
  end
end

class Player < Participant
  def initialize
    super
    @name = 'Player'
  end
end

class Dealer < Participant
  def initialize
    super
    @name = 'Dealer'
  end
end

class Deck
  attr_accessor :cards

  HEART = "\u2665"
  CLUB = "\u2663"
  DIAMOND = "\u2666"
  SPADE = "\u2660"

  RANKS = ((2..10).to_a + %w(J Q K A)).freeze
  SUITS = [HEART, CLUB, DIAMOND, SPADE].freeze

  def initialize
    reset
  end

  def reset
    @cards = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end
    @cards.shuffle!
  end
end

class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

class Game
  include Displayable

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def start
    display_welcome_message
    deal_cards
    display_cards(true)
    player_turn
    dealer_turn unless player.busted?
    show_result
  end

  private

  attr_reader :player, :dealer, :deck

  def deal_cards
    2.times { player.cards << deck.cards.pop }
    2.times { dealer.cards << deck.cards.pop }
  end

  def player_turn
    loop do
      answer = hit_or_stick
      answer == 'hit' ? player.hit(deck) : break
      display_dealing_msg
      display_cards(true)
      break if player.busted?
    end
    player.busted? ? return : player.stick
  end

  def hit_or_stick
    answer = ''
    loop do
      puts "\nWould you like to hit or stick?"
      answer = gets.chomp.downcase
      break if ['hit', 'stick'].include?(answer)
      puts "Invalid input, please just enter hit or stick"
    end
    answer
  end

  def dealer_turn
    dealer.hit(deck) until dealer.total >= 17 || dealer.busted?
    display_cards(false)
  end

  def show_result
    display_dealer_total unless player.busted?
    display_outcomes
  end
end

Game.new.start
