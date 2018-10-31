require_relative 'piece'

class Rook < Piece
  
  def symbol
    '♜'.colorize(color)
  end
  
  def valid_moves
    # moves = []
    # x, y = pos
    # 
    # forward_pos = [x + direction, y]
    # if board.valid_move?(forward_pos) && board.empty?(forward_pos)
    #   moves << forward_pos
    #   moves << [x + direction * 2, y] if first_move?
    # end
    # moves
    
    # moves = []
    # x, y = pos
    # 
    # forward_pos = [x + direction, y]
    # until board[forward_pos].color != color
    #   moves << forward_pos if board.valid_move?(forward_pos)
    #   forward_pos = [forward_pos[0] + direction, y]
    # end
    # moves << forward_pos if board.valid_move?(forward_pos)
    # horizontal_moves + 
    forward_moves + backwards_moves
  end
  
  def horizontal_moves
  end
  
  def forward_moves
    moves = []
    x, y = pos
    
    forward_pos = [x + direction, y]
    # return [] if forward_pos[0] > 7
    until !board.empty?(forward_pos)
      moves << forward_pos if board.valid_move?(forward_pos)
      forward_pos = [forward_pos[0] + direction, y]
    end
    moves << forward_pos if board[forward_pos].color != color
    moves
  end
  
  def backwards_moves
    moves = []
    x, y = pos
    
    forward_pos = [x - direction, y]
    return [] if forward_pos[0] < 0
    until !board.empty?(forward_pos)
      moves << forward_pos if board.valid_move?(forward_pos)
      forward_pos = [forward_pos[0] - direction, y]
    end
    moves << forward_pos if board[forward_pos].color != color
    moves
  end
  
  # def right_moves
  #   moves = []
  #   x, y = pos
  # 
  #   forward_pos = [x, y + direction]
  #   until !board.empty?(forward_pos)
  #     moves << forward_pos if board.valid_move?(forward_pos)
  #     forward_pos = [x, forward_pos[1] + direction]
  #   end
  #   moves << forward_pos if board[forward_pos].color != color
  #   moves
  # end
  
  def direction
    color == :black ? 1 : -1
  end

end
