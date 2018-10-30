require 'colorize'
require_relative 'cursor'

POOP_EMOJI = "\u{1f4a9}"

class Display
  attr_reader :cursor 
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], @board)
  end
  
  def render
    system("clear")
    @board.grid.each do |row|
      puts row.map { |piece| piece.is_a?(NullPiece) ? ' ' : POOP_EMOJI }.join(' ')
    end
    @cursor.get_input
    @board[@cursor.cursor_pos] = "X"
  end
end

while true
  
  
end