require_relative 'pieces'
require_relative 'display'
require_relative 'human_player'
require 'colorize'

POOP_EMOJI = "\u{1f4a9}"
# BLACK_PIECE_LOCATIONS = {
#   :rook => [[0, 0], [0, 7]],
#   :knight => [[0, 1], [0, 6]],
#   :bishop => [[0, 2], [0, 5]],
#   :queen => [[0, 3]],
#   :king => [[0, 4]]
# }
# WHITE_PIECE_LOCATIONS = {
#   :rook => [[0, 0], [0, 7]],
#   :knight => [[0, 1], [0, 6]],
#   :bishop => [[0, 2], [0, 5]],
#   :queen => [[0, 3]],
#   :king => [[0, 4]]
# }

class Board
  attr_reader :sentinel, :grid
  
  def initialize
    @sentinel = NullPiece.instance
    @grid = Array.new(8) { Array.new(8) }
    populate_board
  end
  
  def populate_board
    # (0..7).each do |row|
    #   (0..7).each do |col|
    #     # pawns
    #     if row == 1 || row == 6 || row == 0 || row == 7
    #       @grid[row][col] = Piece.new
    #     else
    #       @grid[row][col] = NullPiece.new
    #     end
    #   end
    # end
    (0..7).each do |row|
      (0..7).each do |col|
        pos = [row, col]
        if [2, 3, 4, 5].include?(row)
          self[pos] = sentinel
        elsif row == 1
          self[pos] = Pawn.new(:black, self, pos)
        elsif row == 6
          self[pos] = Pawn.new(:white, self, pos)
        elsif pos == [0, 0] || pos == [0, 7]
          self[pos] = Rook.new(:black, self, pos)
        elsif pos == [7, 0] || pos == [7, 7]
          self[pos] = Rook.new(:white, self, pos)
        elsif pos == [0, 1] || pos == [0, 6]
          self[pos] = Knight.new(:black, self, pos)
        elsif pos == [7, 1] || pos == [7, 6]
          self[pos] = Knight.new(:white, self, pos)
        elsif pos == [0, 2] || pos == [0, 5]
          self[pos] = Bishop.new(:black, self, pos)
        elsif pos == [7, 2] || pos == [7, 5]
          self[pos] = Bishop.new(:white, self, pos)
        elsif pos == [0, 3]
          self[pos] = Queen.new(:black, self, pos)
        elsif pos == [7, 3]
          self[pos] = Queen.new(:white, self, pos)
        elsif pos == [0, 4]
          self[pos] = King.new(:black, self, pos)
        elsif pos == [7, 4]
          self[pos] = King.new(:white, self, pos)
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
  
  def empty?(pos)
    self[pos].is_a?(NullPiece)
  end
  
  def move_piece(start_pos, end_pos)
    raise "You didn't select a piece!" if self[start_pos].is_a?(NullPiece)
    # raise "Invalid move!" unless self[end_pos].valid_move?(start_pos)
    if self[start_pos].valid_moves.include?(end_pos)
      self[start_pos].pos, self[end_pos].pos = end_pos, start_pos
      if self[end_pos].is_a?(NullPiece)
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
      else
        self[end_pos] = self[start_pos]
        self[start_pos] = sentinel
      end
    end
    
  end
end
