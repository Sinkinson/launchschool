CARD_DECK = [[2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'],
             [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'],
             [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'],
             [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']]

def clear_screen
  system 'clear'
end

def prompt(msg)
  puts "--> #{msg}"
end

def initialize_deck
  CARD_DECK.flatten.shuffle
end

def picture_card_replacer(card_array)
  number_cards = card_array.map do |card|
    if card == 'Jack' || card == 'Queen' || card == 'King'
      10
    elsif card == 'Ace'
      11
    else
      card
    end
  end
    number_cards.each do |card|
    if card == 11 && number_cards.sum > 21
      number_cards[number_cards.index(card)] = 1
    end
  end
  number_cards
end

def joiner(cards, delim= ', ', word= 'and')
  case cards.size
  when 2 then cards.join(" #{word} ")
  else
    cards[-1] = "#{word} #{cards.last}"
    cards.join(delim)
  end
end

def total_check(cards)
  final_cards = picture_card_replacer(cards)
  if final_cards.sum > 21
    "BUST"
  else
    final_cards.sum
  end
end

def hit_or_stick(card_deck, choice, players_cards)
  case choice
  when 'hit'
    clear_screen
    players_cards << card_deck.shift
    puts "You have: #{players_cards.join(', ')}"
    sleep(1)
  end
end

def welcome
  clear_screen
  puts "-------------------------"
  puts "Welcome to the game of 21"
  puts "-------------------------"
  puts ''
  puts "The aim is to get as close to 21 as possible without going over"
  puts ''
  puts "You can either hit or stick"
  puts ''
  prompt("Hitting gives you one more card")
  prompt("Sticking keeps the cards you've got")
  puts ''
end

def game_starter
  puts "Press enter when you are ready to begin"
  loop do
    break if gets.chomp == ''
    puts "Invalid input, just press enter"
  end
end

def show_winner(players_cards, computer_cards)
  puts "The final cards are:"
  puts "Computer: #{joiner(computer_cards)}"
  puts "You: #{joiner(players_cards)}"
end

players_cards = []
computer_cards = []

welcome
game_starter

loop do
  players_cards.clear
  computer_cards.clear
  clear_screen

  card_deck = initialize_deck

  2.times do 
    players_cards << card_deck.shift
    computer_cards << card_deck.shift
  end

  puts "Computer has: #{computer_cards.sample} and unknown card"
  puts "You have: #{players_cards.join(' and ')}"

  loop do
    choice = ''
    loop do
      prompt("Would you like to hit or stick?")
      choice = gets.chomp.downcase
      hit_or_stick(card_deck, choice, players_cards)
      break if choice == 'stick' || total_check(players_cards) == "BUST"
    end

    if total_check(players_cards) == "BUST"
      puts ''
      puts "You've gone bust, Computer wins"
      break
    end

    loop do
      final_cards = picture_card_replacer(computer_cards)
      final_cards.sum < 17 ? computer_cards << card_deck.shift : break
    end

    clear_screen

    if total_check(computer_cards) == 'BUST'
      puts ''
      puts "The computer has gone bust, you win"
      sleep(1)
      puts ''
      show_winner(players_cards, computer_cards)
      break
    end

    if choice == 'stick'
      winner = total_check(players_cards) <=> total_check(computer_cards)
      show_winner(players_cards, computer_cards)
      sleep(1)
      puts ''
      puts "** You win **" if winner == 1
      puts "** It's a draw **" if winner == 0
      puts "** You lose **" if winner == -1
      break
    end
  end

  sleep(1)
  puts ''
  puts "Want to play again? (y or n)"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

puts "Thanks for playing 21"
