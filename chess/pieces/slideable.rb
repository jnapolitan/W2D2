module Slideable
  HORIZONTAL_DIRS = [
    [-1, 0],
    [0, -1],
    [0, 1],
    [1, 0]
  ].freeze

  DIAGONAL_DIRS = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1]
  ].freeze
  
  def horizontal_dirs
    HORIZONTAL_DIRS
  end
  
  def diagonol_dirs
    DIAGONAL_DIRS
  end
  
  def moves
    moves = []
    
    move_dirs.each do 
      
    end
  end

end
