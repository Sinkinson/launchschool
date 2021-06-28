MAX_WINS = 3

COMBOS = {
 'rock' => { shorthand: 'r', beats: ['scissors', 'lizard'] },
 'paper' => { shorthand: 'p', beats: ['rock', 'spock'] },
 'scissors' => { shorthand: 'sc', beats: ['paper', 'lizard'] },
 'lizard' => { shorthand: 'l', beats: ['spock', 'paper'] },
 'spock' => { shorthand: 'sp', beats: ['scissors', 'rock'] }
}

RULES = <<-MSG
These are the rules of the game

scissors cuts paper covers rock crushes
lizard posions spock smashes scissors
decapitates lizard eats paper disproves
spock vaporizes rock crushes scissors

MSG

def clear
  system('clear')
end

def prompt(message)
  puts "=> #{message}"
end

def winner?(first, second)
  COMBOS[first][:beats].include?(second)
end

def display_results(player, computer)
  if winner?(player, computer)
    prompt("You win!")
  elsif winner?(computer, player)
    prompt("Computer wins!")
  else
    prompt("Tie!")
  end
  sleep(1)
end

def update_score(player, computer, leader)
  if winner?(player, computer)
    leader[:player] += 1
  elsif winner?(computer, player)
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

def display_champion(leader)
  if leader[:player] == MAX_WINS
    prompt("You won #{MAX_WINS} rounds, congrats you are the champion")
  elsif leader[:computer] == MAX_WINS
    prompt("The computer was the first to #{MAX_WINS}, tough luck")
  end
  sleep(1)
end

def wipe_scores(leader)
  leader[:player] = 0
  leader[:computer] = 0
end

def welcome_message
  puts "Welcome to rock, paper, scissors, lizard, spock"
  puts "-----------------------------------------------"
  puts RULES
  puts "The first to #{MAX_WINS} is the champion"
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
    if COMBOS.keys.include?(choice)
      return choice
    elsif COMBOS.map { |k, v| v.fetch(:shorthand) }.include?(choice)
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

leader = { player: 0, computer: 0 }
clear
welcome_message
game_starter
clear

loop do
  loop do
    display_scoreboard(leader)
    computer_choice = COMBOS.keys.sample
    choice = get_choice
    display_choices(choice, computer_choice)
    display_results(choice, computer_choice)
    update_score(choice, computer_choice, leader)
    break if leader[:player] == MAX_WINS || leader[:computer] == MAX_WINS
  end

  clear
  display_champion(leader)
  break unless play_again?
  wipe_scores(leader)
  clear
end

prompt("Thanks for playing")
