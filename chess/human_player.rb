require_relative 'display'
require_relative 'player'

class HumanPlayer < Player
  
  def make_move
    start_pos, end_pos = nil, nil
    
    until start_pos && end_pos
      display.render
      
      if start_pos
        puts "\nWhere do you want to move it?"
        end_pos = display.cursor.get_input
      else
        puts "\nWhat piece do you want to move?"
        start_pos = display.cursor.get_input
      end
    end
    
    [start_pos, end_pos]
  end
  
end
