require_relative 'display'
require_relative 'piece'

class Board
  attr_reader :grid
  
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    populate_board
  end
  
  def populate_board
    (0..7).each do |row|
      (0..7).each do |col|
        # pawns
        if row == 1 || row == 6 || row == 0 || row == 7
          @grid[row][col] = Piece.new
        else
          @grid[row][col] = NullPiece.new
        end
      end
    end
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end
  
  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end
  
  def valid_move?(pos)
    pos.all? { |coord| (0..7).include?(coord) }
  end
  
  def move_piece(start_pos, end_pos)
    raise "You didn't select a piece!" if self[start_pos].is_a?(NullPiece)
    # raise "Invalid move!" unless self[end_pos].valid_move?(start_pos)
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end
  
  def render
    system("clear")
    @grid.each do |row|
      puts row.map { |piece| piece.is_a?(NullPiece) ? ' ' : POOP_EMOJI.blink }.join(' ')
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  new_board = Board.new
  # def troll(new_board)
  #   while true
  #     rand_start = [rand(2..5), rand(8)]
  #     rand_end = [rand(2..5), rand(8)]
  #     sleep(2)
  #     new_board.move_piece(rand_start, rand_end)
  #     new_board.render
  #     sleep(2)
  #     new_board.move_piece(rand_end, rand_start)
  #     new_board.render
  #   end
  # end
  # troll(new_board)
  new_display = Display.new(new_board)
  new_display.render
end
