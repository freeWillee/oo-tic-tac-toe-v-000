class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #first column
    [1,4,7], #second column
    [2,5,8], #third column
    [0,4,8], #back-slash
    [2,4,6] #forward-slash
  ]

  def display_board(@board)
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

#converts user_input to an integer
def input_to_index(user_input)
  return user_input.to_i - 1
end

#Your #move method must take in three arguments: 1) the board array, 2) the index in the board array that the player would like to fill out with an "X" or and "O", and 3) the player's character (either "X" or "O"). We previously had you write this method with a default argument of "X" for the third argument, but that is no longer needed.
def move(@board, index, token)
  @board[index] = token
end

# The #position_taken? method will be responsible for evaluating the position selected by the user against the Tic Tac Toe board and checking to see whether or not that index on the board array is occupied. If the user would like to fill out position 1, our #position_taken? method will check to see if that board index is vacant or if it contains an "X" or an "O". If the position is free, the method should return false (i.e. "not taken"), otherwise it will return true.

def position_taken?(@board, index)
  !(@board[index].nil? || @board[index] == " ")
end

# Build a method valid_move? that accepts a board and an index to check and returns true if the move is valid and false or nil if not. A valid move means that the submitted position is: Present or Not already filled
def valid_move?(@board, index)
  if !index.between?(0,8) || position_taken?(@board, index)
    #index.between?(0,8)
    #((0..8) === index)
    false
  else
    true
  end
end

#define the turn method.
def turn(@board)
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  if valid_move?(@board, index)
    move(board, index, current_player(@board))
    display_board(@board)
  else
    #binding.pry
    puts "That was an invalid entry."
    turn(@board)

  end
end

end
