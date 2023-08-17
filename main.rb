require '../lib/tictactoe.rb'

#Object instance of Tictactoe
tic_tac_toe = Game.new

# display board information
tic_tac_toe.getboard

# run until the game is over
until tic_tac_toe.plays == 0 || tic_tac_toe.win

  print "\nEnter row: "
  row = gets.chomp.to_i - 1
  print 'Enter col: '
  col = gets.chomp.to_i - 1

  tic_tac_toe.make_move(row, col) #commit the move
end

 puts "Draw" if !tic_tac_toe.win
 puts "#{tic_tac_toe.current_player} wins!" if tic_tac_toe.win



