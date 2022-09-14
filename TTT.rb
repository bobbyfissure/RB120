class Board
  WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9], 
                  [1,4,7],[2,5,8],[3,6,9],
                  [1,5,9],[3,5,7]]

  attr_reader :squares

  def initialize
    @squares = {}
    reset
  end

  def draw
    puts ""
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----------------"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----------------"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
    puts ""
  end

  def clear_screen_and_display_board
    clear
    draw
  end

  def clear
    system "clear"
  end


  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end

  def []=(target, updated_marker)
    @squares[target].marker = updated_marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked?}
  end

  def full?
    unmarked_keys.empty?
  end

  def winner_marker
    WINNING_LINES.each do |line|
      grouped = [@squares[line[0]].marker, @squares[line[1]].marker, @squares[line[2]].marker]
      if grouped.count(Square::HUMAN_MARKER) == 3
        return ["You", line]
      elsif grouped.count(Square::COMPUTER_MARKER) == 3
        return ["Computer", line]
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new}
  end

  

end

class Square
  INITIAL_MARKER = " "
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end


class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def mark
  end

  def play
  end
end

class Scoreboard 
  attr_accessor :human_score, :computer_score

  def initialize
    @human_score = 0
    @computer_score = 0
  end
end

class TTTGame
  FIRST_TO_MOVE = :human
  
  attr_reader :board, :human, :computer
  attr_accessor :player, :scoreboard
  def initialize
    @board = Board.new
    @human = Player.new(Square::HUMAN_MARKER)
    @computer = Player.new(Square::COMPUTER_MARKER)
    @player = FIRST_TO_MOVE
    @scoreboard = Scoreboard.new
  end

  def play
    display_welcome_message
    loop do
      display_board
      loop do
        display_board
        loop do
          #sleep 1
          current_player_moves
          clear_screen_and_display_board
          break if board.winner_marker || board.full? 
        end
        display_result
        update_scoreboard
        display_scoreboard
        break if detect_match_winner
        display_board
        board.reset
        reset_stats
        next if ready_check?
        end
        display_match_winner
        break if play_again? == "n"
        reset_scoreboard
    end
    display_goodbye_message
  end

 
  
  private
 
  def display_welcome_message
    puts "Welcome to Launch School's TTT. I'll be your host Zach Korner."
    puts ""
  end


  def display_board
    puts "You are #{Square::HUMAN_MARKER}. Computer is #{Square::COMPUTER_MARKER}."
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def clear
    system "clear"
  end

  def current_player_moves
    if @player == :human
      human_moves
      @player = :computer
    elsif @player == :computer
      computer_moves
      @player = :human
    end
  end

  def join_or(arr, punctuation = ", ", word = "or")
    if arr.size > 1
    "#{arr.slice(0..-2).join(punctuation)} #{word} #{arr[-1]}"
    else 
      arr.first
    end
  end

  def human_moves
    puts "Choose a square #{join_or(board.unmarked_keys)}"
    square = ""
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry not a valid choice. Please enter a number #{board.unmarked_keys.join(", ")}."
    end
    board[square] = Square::HUMAN_MARKER
  end

  def computer_moves
    if ai_offense
      board[ai_offense] = Square::COMPUTER_MARKER
    elsif ai_defense
      board[ai_defense] = Square::COMPUTER_MARKER
    else
      square = board.unmarked_keys.sample
      board[square] = Square::COMPUTER_MARKER
    end
  end

  def ai_defense
    Board::WINNING_LINES.each do |line|
      grouped = [board.squares[line[0]].marker, board.squares[line[1]].marker, board.squares[line[2]].marker]
      if grouped.count(Square::HUMAN_MARKER) == 2 && grouped.count(Square::INITIAL_MARKER) == 1
        return square = line.select {|sq| board.squares[sq].marker == Square::INITIAL_MARKER}.first
      end
    end
    false
  end

  def ai_offense
    return 5 if board.squares[5].marker == Square::INITIAL_MARKER
    Board::WINNING_LINES.each do |line|
      grouped = [board.squares[line[0]].marker, board.squares[line[1]].marker, board.squares[line[2]].marker]
      if grouped.count(Square::COMPUTER_MARKER) == 2 && grouped.count(Square::INITIAL_MARKER) == 1
        return square = line.select {|sq| board.squares[sq].marker == Square::INITIAL_MARKER}.first
      end
    end
    false
  end

  def display_result
    if board.winner_marker
      puts "#{board.winner_marker.first} won."
    elsif board.full?
      puts "Its a tie."
    end
  end

  def update_scoreboard
    if board.winner_marker.first == "You"
      scoreboard.human_score += 1
    elsif board.winner_marker.first == "Computer"
      scoreboard.computer_score += 1
    end
  end

  def display_scoreboard
    puts "You have #{scoreboard.human_score}. Computer has #{scoreboard.computer_score}."
    puts "Winner is first to three."
  end

  def detect_match_winner
    return "You" if scoreboard.human_score == 3
    return "Computer" if scoreboard.computer_score == 3
    false
  end  

  def display_match_winner
    puts "#{detect_match_winner} won in daring style!"
    puts "Final score - you : #{scoreboard.human_score}, computer : #{scoreboard.computer_score}."
  end

  def reset_scoreboard
    scoreboard.human_score = 0
    scoreboard.computer_score = 0
  end

  def play_again?
    choice = nil
    loop do
      puts "Do you want to play again? (y/n)"
      choice = gets.chomp.downcase
      break if %w(y n).include? choice
      puts "Please enter y or n."
    end
    choice #this will either be 'y' or 'n'
  end

  def ready_check?
    choice = nil
    loop do
      puts "Are you ready for the next round? (y/n)"
      choice = gets.chomp.downcase
      break if %w(y n).include? choice
      puts "Please enter y or n."
    end
    choice #this will either be 'y' or 'n'
  end

  def reset_stats
    @player = FIRST_TO_MOVE
    @turn = 0
  end

  def display_goodbye_message
    puts "We hope you enjoyed playing Tic Tac Toe."
  end
end

game = TTTGame.new
game.play