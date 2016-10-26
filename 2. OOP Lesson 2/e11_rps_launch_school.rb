#
# Rock, Paper, Scissors
#

class Player
  attr_accessor :move, :name

  def initialize
    @move = nil
    @name = nil
    set_name
  end
end

class Human < Player
  def choose
    choice = nil
    loop do
      puts "Please choose Rock, Paper or Scissors:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      puts "Invalid choice! Please try again."
    end
    self.move = Move.new(choice)
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
    self.move = Move.new(Move::VALUES.sample)
  end

  def set_name
    self.name = %w(R2D2 C-3PO Hal Deep\ Blue Chappie).sample
  end
end

class Move
  VALUES = %w(rock paper scissors).freeze

  def initialize(value)
    @value = value
  end

  def rock?
    @value == "rock"
  end

  def paper?
    @value == "paper"
  end

  def scissors?
    @value == "scissors"
  end

  def >(other_move)
    rock? && other_move.scissors? ||
      paper? && other_move.rock? ||
      scissors? && other_move.paper?
  end

  def ==(other_move)
    @value == other_move.obtain_value
  end

  def to_s
    @value.capitalize
  end

  protected

  def obtain_value
    @value
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
    if human.move > computer.move
      puts "#{human.name} wins!"
    elsif human.move == computer.move
      puts "It's a tie!"
    else
      puts "#{computer.name} wins!"
    end
  end

  def display_moves
    puts
    puts "#{human.name} chose: #{human.move}."
    puts "#{computer.name} chose: #{computer.move}."
    puts
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

game = RPSGame.new
game.play
