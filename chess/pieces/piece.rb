# require 'colorize'

class Piece
  attr_reader :board, :color
  attr_accessor :pos
  
  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos
  end
  
  def to_s
    " #{symbol} "
  end
  
  def empty?
  end
  
  def valid_moves
    raise NotImplementedError
  end
  
  def pos=(val)
    @pos = val
  end
  
  def symbol
    @color
  end
  
  private
  
  def move_into_check?
  end
  
end


