class Move 
  VALUES = ['rock', 'paper', 'scissors']
  WEIGHTED_VALUES = ["rock", "rock", "paper", "paper", "scissors"]
  def initialize(value)
    @value = value
  end

  def scissors?
    @value == "scissors"
  end

  def paper?
    @value == "paper"
  end

  def rock?
    @value == "rock"
  end

  def >(other_move)
    if rock?
      return true if other_move.scissors?
      return false
    elsif paper?
      return true if other_move.rock?
      return false
    else
      return true if other_move.paper?
      return false
    end
  end

  def <(other_move)
    if rock?
      return true if other_move.paper?
      return false
    elsif paper?
      return true if other_move.scissors?
      return false
    else
      return true if other_move.rock?
      return false
    end
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :player_type, :name, :score, :move_history
  
  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    set_name
    @score = 0
    @move_history = []
  end

  def to_s
    @move_history
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry must write your name."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do 
      puts "Choose rock paper or scissors!"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry invalid choice."
    end
    self.move = Move.new(choice)
    self.move_history << choice
  end

end

class Computer < Player
  def set_name
    self.name = ["R2D2", "Hal", "BeepBoop", "ZeroOneOne", "C3PO"].sample
  end

  def choose
    case name
    when "R2D2"
      self.move = Move.new("rock")
    when "Hal"
      self.move = Move.new("paper")
    when "BeepBoop"
      self.move = Move.new("scissors")
    when "ZeroOneOne"
      self.move = Move.new(Move::VALUES.sample)
    when "C3PO"
      self.move = Move.new(Move::WEIGHTED_VALUES.sample)
    end
  end

  def record
    self.move_history << self.move
  end

  def to_s
    @move_history.each do |i|
      puts i
    end
  end
end

class RPSGame
  attr_accessor :human, :computer
  
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to RPS LS Ruby"
  end

  def display_goodbye_message
    puts "Thanks for playing!!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."

    if human.move > computer.move
      puts "#{human.name} won"
    elsif human.move < computer.move
      puts "#{computer.name} won"
    else
      puts "Its a tie"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y','n'].include?(answer)
      puts "Sorry invalid answer."
    end

    return true if answer == 'y'
    return false
  end

  def display_scoreboard
    puts "You have #{human.score}. #{computer.name} has #{computer.score}. Game is to 3 wins."
  end

  def increment_winner
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    else
      puts "tie game no increment"
    end
  end

  def winner?
    return true if human.score == 3 || computer.score == 3
  end

  def display_winning_player
    if human.score == 3
      puts "You got to 3 first, you win!"
    elsif computer.score == 3
      puts "#{computer.name} got to 3 first. Computer wins!"
    end
  end

  def display_move_history
    puts "human moves - #{human.move_history}"
    puts "computer moves - #{computer.move_history}"
  end


  def play 
    display_welcome_message
   loop do
      human.choose
      computer.choose
      computer.record
      display_winner
      increment_winner
      display_scoreboard
      break if winner?
    end
    display_winning_player
    display_move_history
    display_goodbye_message
  end

end

RPSGame.new.play