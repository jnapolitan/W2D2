require_relative 'piece'

class Pawn < Piece
  include Stepable
  
  def symbol
    '♟'.colorize(color)
  end
  
  def forward_moves
    moves = []
    x, y = pos
    forward_pos = [x + direction, y]
    if board.valid_move?(forward_pos) && board.empty?(forward_pos)
      moves << forward_pos
      moves << [x + direction * 2, y] if first_move?
    end
    moves
  end
  
  def attacks
    moves = []
    x, y = pos
    
    attack_moves = [[x + direction, y + 1], [x + direction, y - 1]]
    attack_moves.each do |attack_move|
      if board.valid_move?(attack_move) && board[attack_move].color != color && !board.empty?(attack_move)
        puts "ATTACK!"
        moves << attack_move
      end
    end
    moves
  end
  
  def valid_moves
    forward_moves + attacks
  end
  
  def direction
    color == :black ? 1 : -1
  end
  
  def first_move?
    x, y = pos
    return true if (x == 1 && color == :black) || (x == 6 && color == :white)
    false
  end
end