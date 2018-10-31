require 'colorize'
require_relative 'cursor'

# POOP_EMOJI = "\u{1f4a9}"

class Display
  attr_reader :cursor 
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], @board)
  end
  
  def render
    system('clear')
    cursor_pos = @cursor.cursor_pos
    (0..7).each do |x|
      puts ''
      (0..7).each do |y|
        pos = [x, y]
        if pos == cursor_pos
          color = @board[pos].color
          if color == :black
            print @board[pos].to_s.colorize(:color => :white, :background => :black)
          elsif color == :white
            print @board[pos].to_s.colorize(:color => :black, :background => :white)
          else
            print @board[pos].to_s.colorize(:background => :light_black)
          end
        else 
          print @board[pos].to_s
        end
      end
    end
  end
end
