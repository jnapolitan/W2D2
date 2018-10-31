require_relative 'board'

class Game
  
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player1 = HumanPlayer.new(:black, @display)
    @player2 = @player1
    @current_player = @player1
  end
  
  def play
    loop do
      start_pos, end_pos = @current_player.make_move
      @board.move_piece(start_pos, end_pos)
      #switch_players!
    end
  end
  
  def switch_players!
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
  
end

if __FILE__ == $PROGRAM_NAME
  new_game = Game.new
  new_game.play
end