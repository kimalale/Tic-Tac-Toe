# Class For the Tic Tac Toe

class Game
  attr_reader :current_player, :winner, :plays

  def initialize
    @plays = 9
    @board = Array.new(3) { Array.new(3) { ' ' } }
    @current_player = 'X'
  end

  # lazy to document
  def getboard
    puts "Tic Tac Toe:     Player #{@current_player} \n\n"
    for i in 0..2

      print @board[i]
      print "\n"

    end
    # @board
  end

  # lazy to document
  def make_move(row, col)
    system('clear')
    if row >= 0 && row <= 2 && col >= 0 && col <= 2
      if @board[row][col] != 'X' && @board[row][col] != 'O'
        @board[row][col] = @current_player
        switch_player
        getboard
        check_win
      else
        getboard
        puts "\nError: Warning, the slot is entered!"
      end
      @plays -= 1

    else
      getboard
    end
  end

  def check_win
    # check win... lazy to document
    first_elements = @board.map { |sub_array| sub_array[0] }
    second_elements = @board.map { |sub_array| sub_array[1] }
    third_elements  = @board.map { |sub_array| sub_array[2] }

    # lazy to document
    first_diagonal = [@board[0][0], @board[1][1], @board[2][2]]
    second_diagonal = [@board[0][2], @board[1][1], @board[2][0]]

    # lazy to document
    @board.map do |row|
      if row.all?('X') || first_elements.all?('X') || second_elements.all?('X') || third_elements.all?('X') || first_diagonal.all?('X') || second_diagonal.all?('X')
        @plays = 0
        puts "\nPlayer X wins"
        return
      elsif row.all?('O') || first_elements.all?('O') || second_elements.all?('O') || third_elements.all?('O') || first_diagonal.all?('O') || second_diagonal.all?('O')
        @plays = 0
        puts "\nPlayer O wins"
        return
      end
    end
  end

  # lazy to document
  def switch_player
    @current_player = if @current_player == 'O'
                        'X'
                      else
                        'O'
                      end
  end
end

# lazy to document
system('clear')
tic_tac_toe = Game.new

# lazy to document
tic_tac_toe.getboard

# lazy to document
while tic_tac_toe.plays > 0

  print "\nEnter row: "
  row = gets.chomp.to_i - 1
  print 'Enter col: '
  col = gets.chomp.to_i - 1

  tic_tac_toe.make_move(row, col)
end
