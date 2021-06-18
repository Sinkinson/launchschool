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
end

def wipe_scores(leader)
  leader[:player] = 0
  leader[:computer] = 0
end

leader = { player: 0, computer: 0 }

clear

puts "Welcome to rock, paper, scissors, lizard, spock"
puts "-----------------------------------------------"

info = <<-MSG
These are the rules of the game

scissors cuts paper covers rock crushes
lizard posions spock smashes scissors
decapitates lizard eats paper disproves
spock vaporizes rock crushes scissors

MSG
puts info
puts "The first to 3 is the champion"
puts "-----------------------------------------------"

loop do
  prompt("Press enter key to begin")
  answer = gets.chomp
  break if answer == ''
end

clear

loop do
  loop do
    score_board = <<-MSG
    Current scores
    You: #{leader[:player]}
    CPU: #{leader[:computer]}
    MSG
    puts score_board

    choice = ''
    computer_choice = VALID_CHOICES.sample

    loop do
      prompt("Choose one: (r)ock, (p)aper, (sc)issors, (l)izard, (sp)ock")
      choice = gets.chomp.downcase
      clear
      if VALID_CHOICES.include?(choice)
        break
      elsif VALID_CHOICES_2.include?(choice)
        choice = alt_choice(choice)
        break
      else
        prompt("That's not a valid choice")
      end
    end

    prompt("You chose: #{choice}; computer chose: #{computer_choice}")
    sleep(1)
    display_results(choice, computer_choice)
    leader_board(choice, computer_choice, leader)
    break if leader[:player] == 3 || leader[:computer] == 3
  end

  clear
  champion(leader)
  sleep(1)
  prompt("Do you want to play again? (yes/no)")
  answer = gets.chomp
  if answer.downcase.start_with?("y")
    wipe_scores(leader)
    clear
  else
    break
  end
end

prompt("Thanks for playing")
