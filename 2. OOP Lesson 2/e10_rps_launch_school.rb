#
# Rock, Paper, Scissors
#

class Player
  attr_accessor :move, :name

  RPS_CHOICES = %w(rock paper scissors).freeze

  def initialize
    @move = nil
    @name = nil
    set_name
  end

  def win(other_player)
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
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts
    puts "Welcome to 'Rock, Paper, Scissors'!"
    puts
    puts "Human is called #{human.name}."
    puts "Computer is called #{computer.name}."
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

  def display_choices
    puts
    puts "#{human.name} chose: #{human.move.capitalize}."
    puts "#{computer.name} chose: #{computer.move.capitalize}."
    puts
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_choices
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

game = RPSGame.new
game.play
