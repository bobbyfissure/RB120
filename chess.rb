class Board
  attr_reader :grid
  
  def self.start_chess
    board = self.new
    8.times do |c|
      board[[1,c]] = Pawn.new(:black)
      board[[6,c]] = Pawn.new(:white)
    end

    board[[0,0]] = Rook.new(:black)
    board[[0,7]] = Rook.new(:black)
    board[[7,0]] = Rook.new(:white)
    board[[7,7]] = Rook.new(:white)

    board[[0,1]] = Knight.new(:black)
    board[[0,6]] = Knight.new(:black)
    board[[7,1]] = Knight.new(:white)
    board[[7,6]] = Knight.new(:white)

    board[[0,2]] = Bishop.new(:black)
    board[[0,5]] = Bishop.new(:black)
    board[[7,2]] = Bishop.new(:white)
    board[[7,5]] = Bishop.new(:white)

    board[[0,3]] = Queen.new(:black)
    board[[7,3]] = Queen.new(:white)

    board[[0,4]] = King.new(:black)
    board[[7,4]] = King.new(:white)
    board
  end
  
  def initialize
    @grid = Array.new(8) { Array.new }
  end

  def []=(location, piece)
    row, column = location
    @grid[row][column] = piece
  end

  def [](location)
    row, column = location
    grid[row][column]
  end

  def in_bounds?(location)
    row, column = location
    row < grid.length && column < grid.first.length &&
    row >= 0 && column >= 0
  end
  
  def to_s
    grid
  end
end


class Pawn
  attr_reader :color
  
  def initialize(color)
    @color = color
  end

  def row
    @location.first
  end

  def column
    @location.last
  end
  
  def move_dirs
    [
      [0,1]
    ]
  end

  def starting_pos?
    row == 1 || row == 6
  end


  def to_s
    color == :black ?  "♙" : "♟️"
   end

end

class Rook
  attr_reader :color
  
  def initialize(color)
    @color = color
  end
 
  def move_dirs
    [
      [0,1],
      [0,-1],
      [1,0],
      [0,-1]
    ]
  end

  def to_s
    color == :black ? "r" : "R"
  end
end

class Knight
  attr_reader :color
  
  def initialize(color)
    @color = color
  end

  def to_s
    color == :black ? "n" : "N"
  end

  def move_dirs
    [
      [1,2],
      [-1,2],
      [1,-2],
      [1,2],
      [2, 1],
      [2,-1],
      [-2, 1],
      [-2,-1]
    ]
  end
end

class King
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def to_s
    color == :black ? "k" : "K"
  end

  def move_dirs
    [
      [1,0],
      [-1,0],
      [0,1],
      [0,-1],
      [1,1],
      [-1,-1],
      [-1,1],
      [1,-1]
    ]
  end
end

class Queen
  attr_reader :color
  
  def initialize(color)
    @color = color
  end

  def to_s
    color == :black ? "q" : "Q"
  end

  def move_dirs
    [
      [1,0],
      [-1,0],
      [0,1],
      [0,-1],
      [1,1],
      [-1,-1],
      [-1,1],
      [1,-1]
    ]
  end
end

class Bishop
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def to_s
    color == :black ? "b" : "B"
  end

  def move_dirs
    [
      [1,1],
      [-1,-1],
      [-1, 1],
      [1, -1]
    ]
  end
end

class BoardRendererText
  attr_reader :board
  
  def initialize(board)
    @board = board
  end

  def render 
    8.times do |row|
      puts "-" * (32)
      8.times do |col|
        piece = board[[row,col]]
        if piece.nil? || piece.nil? && col == 0
          print "  "
        else 
          print " "
        end
        if col == 0
          print "| #{board[[row,col]]} |"
        else
          print "#{board[[row,col]]} |"
        end
      end
      puts ""
    end
    return 
  end
end

b = Board.start_chess

text_board = BoardRendererText.new(b)
puts text_board.render



