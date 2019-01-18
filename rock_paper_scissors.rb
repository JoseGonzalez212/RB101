VALID_CHOICES = %w(r p sc l sp)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  winning_combos = {
    'r' => %w(sc l),
    'sc' => %w(p lizard),
    'p' => %w(r sp),
    'l' => %w(p sp),
    'sp' => %w(r sc)
  }
  winning_combos[first].include?(second)
end

def results(player, computer)
  if win?(player, computer)
    'You won!'
  elsif win?(computer, player)
    'You lost!'
  else
    'its a tie'
  end
end

def display_scores(score1, score2)
  prompt("Player has #{score1} wins")
  prompt("Computer has #{score2} wins")
end

player_score = 0
computer_score = 0
round_number = 1
start_message = <<-MSG
  Welcome to Rock, paper, scissors, lizard, spock!
  First to 5 wins!
  'r' - rock
  'p' - paper
  'sc' - scissors
  'l' - lizard
  'sp' - spock
MSG

prompt(start_message)

loop do
  choice = ''
  loop do
    prompt("Round #{round_number}: Enter your choice")
    choice = gets.chomp.downcase

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt('Enter a valid choice.')
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice} Computer chose: #{computer_choice}")

  if results(choice, computer_choice) == 'You won!'
    player_score += 1
  elsif results(choice, computer_choice) == 'You lost!'
    computer_score += 1
  end

  prompt(results(choice, computer_choice))
  display_scores(player_score, computer_score)

  if player_score == 5
    prompt('You are the grand winner')
    break
  elsif computer_score == 5
    prompt('The computer is the grand winner')
    break
  end

  round_number += 1
  # system('clear') || system('cls')
end

prompt('Thank you for playing!')
