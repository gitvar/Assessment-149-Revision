#
# Rock, Paper, Scissors is a two-player game where each player chooses one of three possible moves: rock, paper, or scissors. The chosen moves will then be compared to see who wins, according to the following rules:
#
# - rock beats scissors
# - scissors beats paper
# - paper beats rock
#
# If the players chose the same move, then it's a tie.

# Nouns: player, move, rule
# Verbs: choose, compare

# Note that we decided to ignore "rock", "paper" or "scissors", since they are all variations on a move -- almost like different states of a move. Therefore, we capture the major noun: move.

# Now for step 3: organizing the verbs with the nouns. One would think that given the few nouns and verbs we're working with, this would be a very easy exercise. However, it's not obvious where the "compare" verb goes.
#
# Player
#  - choose
# Move
# Rule
#
# - compare

# Notice that a "Player" can "choose", but Move" and "Rule" don't have any verbs at all, and we aren't sure where to put "compare".

# This is an awkward first attempt, but it's all we are comfortable assuming at this point. We'll have to take a stab at defining our classes with this.

# Let's code up some classes and methods. While we do this, we can also think about what "states" the objects of these classes should have.

class Player
  attr_accessor :move, :name

  RPS_CHOICES = %w(rock paper scissors).freeze

  def initialize(player_type = :human)
    @player_type = (player_type == :human ? :human : :computer)
    @move = nil
    @name = nil
    set_name
  end

  # def set_name
  #   self.name = if human?
  #                 chosen_name = nil
  #                 loop do
  #                   print "Please enter your name: "
  #                   chosen_name = gets.chomp
  #                   break unless chosen_name.empty?
  #                   puts "You can't have an empty string for name!"
  #                 end
  #                 chosen_name
  #               else
  #                 %w(R2D2 C-3PO Hal Deep\ Blue Chappie).sample
  #               end
  # end

  def human?
    @player_type == :human ? true : false
  end

  # def choose
  #   self.move = if human?
  #                 choice = nil
  #                 loop do
  #                   puts "Please choose Rock, Paper or Scissors:"
  #                   choice = gets.chomp.downcase
  #                   break if RPS_CHOICES.include? choice
  #                   puts "Invalid choice! Please try again."
  #                 end
  #                 choice
  #               else
  #                 RPS_CHOICES.sample
  #               end
  # end

  def win(other_player)
    puts "#{name} chose: #{move.capitalize}."
    puts "#{other_player.name} chose: #{other_player.move.capitalize}."

    player1_index = RPS_CHOICES.index(move)
    player2_index = RPS_CHOICES.index(other_player.move)

    if (player1_index == player2_index + 1) ||
       (move == RPS_CHOICES.first && other_player.move == RPS_CHOICES.last)
      true
    else
      false
    end
  end

  def equal(other_player)
    move == other_player.move
  end
end

# orchestration EngineL
# After we're done organizing nouns and verbs into classes, we need an "engine" of some sort to orchestrate the objects. This is where the procedural program flow should be. Let's call the "engine" class `RPSGame`.

class Human < Player
  def choose
    choice = nil
    loop do
      puts "Please choose Rock, Paper or Scissors:"
      choice = gets.chomp.downcase
      break if RPS_CHOICES.include? choice
      puts "Invalid choice! Please try again."
    end
    self.move = choice
  end

  def set_name
    chosen_name = nil
    loop do
      print "Please enter your name: "
      chosen_name = gets.chomp
      break unless chosen_name.empty?
      puts "You can't have an empty string for name!"
    end
    self.name = chosen_name
  end
end

class Computer < Player
  def choose
    self.move = RPS_CHOICES.sample
  end

  def set_name
    self.name = %w(R2D2 C-3PO Hal Deep\ Blue Chappie).sample
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to 'Rock, Paper, Scissors'!"
    puts
    puts "Human: #{human.name}."
    puts "Computer: #{computer.name}."
    puts
  end

  def display_goodbye_message
    puts "Goodbye, thanks for playing!"
  end

  def play_again?
    choice = nil
    loop do
      puts "Play again? (y/n)"
      choice = gets.chomp.downcase
      break if %w(y n).include? choice
      puts "Invalid input. Please try again."
    end
    choice == 'y' ? true : false
  end

  def display_winner
    if human.win(computer)
      puts "#{human.name} wins!"
    elsif human.equal(computer)
      puts "It's a tie!"
    else
      puts "#{computer.name} wins!"
    end
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

game = RPSGame.new
game.play
