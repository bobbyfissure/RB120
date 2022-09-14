class Player
  attr_accessor :answer
  
  def initialize
    @answer = nil
  end

end

class Computer < Player

  attr_reader :name

  def initialize
    super()
    @name = ['R2D2', 'MyPillowRobot', 'Clockwerk'].sample
  end
  
  def move
    puts "#{name} is making its move!"
    sleep 2
    puts "..."
    sleep 2
    puts "..."
    sleep 2
    puts "..."
    self.answer = ['rock', 'paper', 'scissors'].sample
  end

  def announce_move
    puts "#{name} chooses #{answer}."
  end

end

class User < Player
  attr_accessor :name

  def initialize
    super()
    @name = nil
  end

  def input_name
    puts "Please enter your full name and social security number."
    self.name = gets.chomp
  end
  
  def move
    loop do 
      puts "Choose 'r' for ROCK 's' for SCISSORS or 'p' for PAPER"
      self.answer = gets.chomp.downcase
      break if %w(r s p).include?(answer)
      puts "Invalid choice."
    end
    answer
  end

  def announce_move
    case answer
    when 'r'
      puts "#{name} chooses rock."
    when 's'
      puts "#{name} chooses scissors."
    when 'p'
      puts "#{name} chooses paper."
    else
      puts "Something's fishy..."
    end
  end
  

end


class Move
  
  def initialize
  end

end

class Rule

  def initialize
  end

  def determine_winner
  end

end

class RPSGame
  attr_accessor :computer, :user

  def initialize
    @computer = Computer.new
    @user = User.new
  end

  def display_welcome_message
    puts "Welcome to Zach's review of RPS for his interview exam."
  end

  def display_goodbye_message
    puts "Goodbye for now."
  end

  def display_matchup
    puts "In the red corner we have our User\n----#{user.name}---\n\nAnd in the blue corner we have our Computer
    \n---#{computer.name}---\n"
  end

  def determine_winner
    if user.answer == "r" && computer.answer == "paper"
      puts "#{computer.name} wins!"
    elsif user.answer == "r" && computer.answer == "scissors"
      puts "#{user.name} wins!"
    elsif user.answer == "p" && computer.answer == "rock"
      puts "#{user.name} wins!"
    elsif user.answer == "p" && computer.answer == "scissors"
      puts "#{computer.name} wins!"
    elsif user.answer == "s" && computer.answer == "paper"
      puts "#{user.name} wins!"
    elsif user.answer == "s" && computer.answer == "rock"
      puts "#{computer.name} wins!"
    else
      puts "Its a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Invalid answer."
    end
    answer == 'n'
  end

  def play
    display_welcome_message
    user.input_name
    display_matchup
    loop do
      user.move
      user.announce_move
      computer.move
      computer.announce_move
      determine_winner
      break if play_again?
    end
    display_goodbye_message
  end

end

game = RPSGame.new
game.play