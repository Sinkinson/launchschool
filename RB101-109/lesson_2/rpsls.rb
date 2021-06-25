VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
VALID_CHOICES_2 = ['r', 'p', 'sc', 'l', 'sp']

COMBOS = { 'rock' => ['lizard', 'scissors'],
           'paper' => ['rock', 'spock'],
           'scissors' => ['paper', 'lizard'],
           'lizard' => ['spock', 'paper'],
           'spock' => ['scissors', 'rock'] }

def clear
  system('clear')
end

def prompt(message)
  puts "=> #{message}"
end

def winner(first, second)
  COMBOS[first].include?(second)
end

def display_results(player, computer)
  if winner(player, computer)
    prompt("You win!")
  elsif winner(computer, player)
    prompt("Computer wins!")
  else
    prompt("Tie!")
  end
  sleep(1)
end

def leader_board(player, computer, leader)
  if winner(player, computer)
    leader[:player] += 1
  elsif winner(computer, player)
    leader[:computer] += 1
  end
end

def alt_choice(choice)
  case choice
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 'sc'
    'scissors'
  when 'l'
    'lizard'
  when 'sp'
    'spock'
  end
end

def champion(leader)
  if leader[:player] == 3
    prompt("You won 3 rounds, congrats you are the champion")
  elsif leader[:computer] == 3
    prompt("The computer was the first to 3, tough luck")
  end
  sleep(1)
end

def wipe_scores(leader)
  leader[:player] = 0
  leader[:computer] = 0
end

def welcome_message(rules)
  puts "Welcome to rock, paper, scissors, lizard, spock"
  puts "-----------------------------------------------"
  puts rules
  puts "The first to 3 is the champion"
  puts "-----------------------------------------------"
end

def game_starter
  prompt("Press enter key to begin")
  loop do
    answer = gets.chomp
    break if answer == ''
    prompt("Just press enter")
  end
end

def display_scoreboard(leader)
  score_board = <<-MSG
  Current scores
  You: #{leader[:player]}
  CPU: #{leader[:computer]}
  MSG
  puts score_board
end

def get_choice
  loop do
    prompt("Choose one: (r)ock, (p)aper, (sc)issors, (l)izard, (sp)ock")
    choice = gets.chomp.downcase
    clear
    if VALID_CHOICES.include?(choice)
      return choice
    elsif VALID_CHOICES_2.include?(choice)
      return alt_choice(choice)
    else
      prompt("That's not a valid choice")
    end
  end
end

def display_choices(choice, computer_choice)
  prompt("You chose: #{choice}; computer chose: #{computer_choice}")
  sleep(1)
end

def play_again?
  prompt("Do you want to play again? (yes/no)")
  loop do
    answer = gets.chomp.downcase
    return true if ['y', 'yes'].include?(answer)
    return false if ['n', 'no'].include?(answer)
    prompt("Invalid input, try again")
  end
end

rules = <<-MSG
These are the rules of the game

scissors cuts paper covers rock crushes
lizard posions spock smashes scissors
decapitates lizard eats paper disproves
spock vaporizes rock crushes scissors

MSG

leader = { player: 0, computer: 0 }
clear
welcome_message(rules)
game_starter
clear

loop do
  loop do
    display_scoreboard(leader)
    computer_choice = VALID_CHOICES.sample
    choice = get_choice
    display_choices(choice, computer_choice)
    display_results(choice, computer_choice)
    leader_board(choice, computer_choice, leader)
    break if leader[:player] == 3 || leader[:computer] == 3
  end

  clear
  champion(leader)
  break unless play_again?
  wipe_scores(leader)
  clear
end

prompt("Thanks for playing")
