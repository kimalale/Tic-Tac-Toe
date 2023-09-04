
class Game
  attr_reader :current_player, :winner, :plays, :win
  @win = false

  def initialize
    @plays = 9
    @board = Array.new(3) { Array.new(3) { '' } }
    @current_player = 'X'
  end

  # Return current state of player boear
  def getboard
    puts "Tic Tac Toe\nCurrent player: #{@current_player} \n\n"
    3.times.each {|i| print "#{@board[i]}\n"}
  end

  def make_move(row, col)
    system('clear') #clear console
    if (0..2) === row && (0..2) === col
      if @board[row][col].empty?
        @board[row][col] = @current_player
        check_win
      else
        puts "\nWarning, the slot: [#{row},#{col}] has already be used!"
      end
    else
      puts "\nWarning, the slot: [#{row},#{col}] is out of bounds!"
    end
  end

  def check_win

    # lazy to document
    first_diagonal = [@board[0][0], @board[1][1], @board[2][2]]
    second_diagonal = [@board[0][2], @board[1][1], @board[2][0]]

    # lazy to document
    @win = @board.map{|a| a[0] }.all?(@current_player) || @board.map{|b| b[1] }.all?(@current_player) ||  @board.map{|c| c[2] }.all?(@current_player) || first_diagonal.all?(@current_player) || second_diagonal.all?(@current_player)

    puts "Player #{@current_player} won" if @winner
    switch_player if !@win
    @win
  end

  # lazy to document
  def switch_player
    @plays -= 1
    @current_player = if @current_player == 'O'
                        'X'
                      else
                        'O'
                      end
  end
end
