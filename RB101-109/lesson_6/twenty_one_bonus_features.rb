HEART = "\u2665"
CLUB = "\u2663"
DIAMOND = "\u2666"
SPADE = "\u2660"

SUITS = [HEART, CLUB, DIAMOND, SPADE]
CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]

BUST_LIMIT = 21
DEALER_GOAL = 17
MAX_WINS = 3

OPTIONS = ['y', 'n', 'yes', 'no']

def initialize_deck
  deck = CARD_VALUES.map do |card|
    SUITS.map do |suit|
      card.to_s + suit.to_s
    end
  end
  deck.flatten.shuffle
end

def clear
  system('clear') || system('cls')
end

def break_line(size)
  puts "-" * size
end

def welcome_message
  puts "Welcome to the game of 21"
  display_rules if yes_no_question("Would you like to see the rules? (y/n)")
end

def yes_no_question(msg)
  puts msg
  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if OPTIONS.include?(answer)
    puts "Invalid input, please enter one of the following: #{OPTIONS}"
  end
  answer == 'y' || answer == 'yes'
end

def display_rules
  break_line(59)
  puts "Aim to get a total as close to 21 without going over"
  puts "\nThere are only two playable options"
  puts " -> Hit: recieve another card"
  puts " -> Stick: keep your current cards"
  puts "\nYou will need to beat the dealer #{MAX_WINS} times to become champion"
  break_line(59)
end

def game_starter
  puts "Press enter when you are ready to start"
  STDIN.gets
end

def loading
  puts "Dealing cards"
  puts '.'
  sleep(0.8)
  puts '..'
  sleep(0.8)
  puts '...'
  sleep(0.5)
  clear
end

def alt_loading
  puts '.'
  sleep(0.5)
  puts '..'
  sleep(0.5)
  puts '...'
  sleep(0.5)
  clear
end

def opening_messages
  clear
  welcome_message
  game_starter
  clear
  loading
end

def deal_cards(deck, player, computer)
  2.times do
    player << deck.shift
    computer << deck.shift
  end
end

def ends(cards)
  cards.map { |card| '+' + '-' * card.size + '+' }.join(' ')
end

def middles(cards)
  cards.map { |card| '|' + card + '|' }.join(' ')
end

def display_hands(player_c, dealer_c, p_total, d_total, scoreboard, hidden=true)
  if hidden
    display_hidden_hand(player_c, dealer_c, p_total, d_total, scoreboard)
  else
    clear
    display_current_score(scoreboard)
    puts "Dealer"
    puts ends(dealer_c)
    puts middles(dealer_c) + " Total: #{d_total}"
    puts ends(dealer_c)
    puts "You"
    puts ends(player_c)
    puts middles(player_c) + " Total: #{p_total}"
    puts ends(player_c)
  end
end

def display_hidden_hand(player_c, dealer_c, p_total, d_total, scoreboard)
  clear
  display_current_score(scoreboard)
  puts "Dealer"
  puts ends(dealer_c[0...-1]) + ' +---+'
  puts middles(dealer_c[0...-1]) + ' | ? |'
  puts ends(dealer_c[0...-1]) + ' +---+'
  puts "You"
  puts ends(player_c)
  puts middles(player_c) + " Total: #{p_total}"
  puts ends(player_c)
end

def display_current_score(scoreboard)
  break_line(16)
  puts "SCOREBOARD".center(16)
  break_line(16)
  puts "You: #{scoreboard[:player]}" + " Dealer: #{scoreboard[:dealer]}"
  puts
end

def gone_bust?(total)
  total > BUST_LIMIT
end

def hit_or_stick
  puts "\nWould you like to hit or stick"
  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if ['hit', 'stick'].include?(answer)
    puts "Invalid input, please enter hit or stick"
  end
  answer
end

def deal!(deck, cards)
  cards << deck.shift
end

def card_convertor(card)
  return 10 if ['J', 'Q', 'K'].include?(card)
  return 11 if card == 'A'
  card.to_i
end

def card_sorter(cards)
  numbers = []
  cards.each do |card|
    if card.size == 2
      numbers << card_convertor(card[0...1])
    elsif card.size == 3
      numbers << card_convertor(card[0...2])
    end
  end
  numbers
end

def ace_convertor(cards)
  c_cards = card_sorter(cards)
  c_cards.map { |card| card == 11 && c_cards.sum > BUST_LIMIT ? 1 : card }.sum
end

def totals(players_cards, dealers_cards)
  player_total = ace_convertor(players_cards)
  dealer_total = ace_convertor(dealers_cards)
  [player_total, dealer_total]
end

players_cards = []
dealers_cards = []
scoreboard = { player: 0, dealer: 0 }

def play_game(players_cards, dealers_cards, scoreboard)
  opening_messages
  loop do
    reset_score(scoreboard)
    main_game_loop(players_cards, dealers_cards, scoreboard)
    display_champion(scoreboard)
    break unless yes_no_question("\nWould you like to play again(y/n)?")
  end
  goodbye_message
end

def main_game_loop(players_cards, dealers_cards, scoreboard)
  loop do
    deck = initialize_deck
    clear
    reset_variables(players_cards, dealers_cards)
    deal_cards(deck, players_cards, dealers_cards)
    result = players_turn(deck, players_cards, dealers_cards, scoreboard)
    dealers_turn(deck, players_cards, dealers_cards, scoreboard) if result == :s
    player_total, dealer_total = totals(players_cards, dealers_cards)
    record_score(scoreboard, player_total, dealer_total)
    display_outcome(player_total, dealer_total)
    break if game_won?(scoreboard)
  end
end

def goodbye_message
  clear
  puts "Thanks for playing 21"
end

def reset_score(scoreboard)
  scoreboard[:player] = 0
  scoreboard[:dealer] = 0
end

def reset_variables(players_cards, dealers_cards)
  players_cards.clear
  dealers_cards.clear
end

def display_champion(scoreboard)
  if scoreboard[:player] == MAX_WINS
    break_line(27)
    puts "~*~ YOU'RE THE CHAMPION ~*~"
    break_line(27)
  else
    break_line(26)
    puts "The dealer is the champion"
    break_line(26)
  end
end

def game_won?(scoreboard)
  scoreboard[:player] == MAX_WINS || scoreboard[:dealer] == MAX_WINS
end

def record_score(scoreboard, player_total, dealer_total)
  if player_total > BUST_LIMIT
    scoreboard[:dealer] += 1
  elsif dealer_total > BUST_LIMIT
    scoreboard[:player] += 1
  elsif player_total > dealer_total
    scoreboard[:player] += 1
  elsif dealer_total > player_total
    scoreboard[:dealer] += 1
  end
end

def players_turn(deck, p_cards, d_cards, scoreboard)
  loop do
    player_total, dealer_total = totals(p_cards, d_cards)
    display_hands(p_cards, d_cards, player_total, dealer_total, scoreboard)
    return if gone_bust?(player_total)
    answer = hit_or_stick
    if answer == 'stick'
      stick_message(player_total, dealer_total)
      return :s
    else
      alt_loading
      deal!(deck, p_cards)
    end
  end
end

def dealers_turn(deck, p_cards, d_cards, scoreboard)
  loop do
    player_total, dealer_total = totals(p_cards, d_cards)
    display_hands(p_cards, d_cards, player_total, dealer_total, scoreboard, false)
    break if dealer_total >= DEALER_GOAL
    break if gone_bust?(dealer_total)
    deal!(deck, d_cards)
  end
end

def display_outcome(player_total, dealer_total)
  sleep(1)
  if player_total > BUST_LIMIT
    puts "\nYou've gone bust"
  elsif dealer_total > BUST_LIMIT
    puts "\nDealer has gone bust"
  elsif player_total > dealer_total
    puts "\nYou won the hand"
  elsif dealer_total > player_total
    puts "\nYou lost the hand"
  else
    puts "\nHand is tied"
  end
  sleep(2)
end

def stick_message(player_total, dealer_total)
  break_line(24)
  puts "Your final total is: #{player_total}"
  break_line(24)
  sleep(1.5)
  clear
  alt_loading unless dealer_total > DEALER_GOAL
end

play_game(players_cards, dealers_cards, scoreboard)
