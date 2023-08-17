
class Game
  attr_reader :current_player, :winner, :plays, :win
  @win = false
  def initialize
    @plays = 9
    @board = Array.new(3) { Array.new(3) { ' ' } }
    @current_player = 'X'
  end

  # Return current state of player boear
  def getboard
    puts "Tic Tac Toe\nCurrent player: #{@current_player} \n\n"
    2.times.each {|i| print "#{@board[i]}\n"}
    end
  end

  def make_move(row, col)

    if row.include?(0..2) && col.includes?(0..2)
      if @board[row][col].empty?
        @board[row][col] = @current_player
        system('clear') #clear console
        getboard
        check_win

      else
        puts "\nWarning, the slot: [#{row+1},#{col+1}] has already be used!"
      end
    else
      puts "\nWarning, the slot: [#{row+1},#{col+1}] is out of bounds!"
    end
  end

  def check_win

    # lazy to document
    first_diagonal = [@board[0][0], @board[1][1], @board[2][2]]
    second_diagonal = [@board[0][2], @board[1][1], @board[2][0]]

    # lazy to document
    @win = @board.map{|a| a[0] }.all?(@current_player) || @board.map{|b| b[1] }.all?(@current_player) 
          ||  @board.map{|c| c[2] }.all?(@current_player) || first_diagonal.all?(@current_player) || second_diagonal.all?(@current_player)
    
    puts "Player #{@current_player} won" if @win
    break if @win
    switch_player
  end

  # lazy to document
  def switch_player

    @current_player = if @current_player == 'O'
                        'X'
                      else
                        'O'
                      end
  end
  @plays -= 1
end

# lazy to document
system('clear')
tic_tac_toe = Game.new

# lazy to document
tic_tac_toe.getboard

# lazy to document
until tic_tac_toe.plays = 0 || tic_tac_toe.won

  print "\nEnter row: "
  row = gets.chomp.to_i - 1
  print 'Enter col: '
  col = gets.chomp.to_i - 1

  tic_tac_toe.make_move(row, col)
end
 puts "Draw" if !tic_tac_toe.win
