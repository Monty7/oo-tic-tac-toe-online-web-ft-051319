require 'pry'

class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize()
    @board = Array.new(9, " ")
  end
  
  def display_board
  
    
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end
   
def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(position)
  @board[position] == "X" || @board[position] == "O"
end

def valid_move?(position)
  position >= 0 && position <= 8 && @board[position] == " "
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please enter a position."
  input = gets.chomp
  index = input_to_index(input)
  
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?
  result = false
  temp = []
    #binding.pry
    WIN_COMBINATIONS.each do |combo_arr|
      
      combo_arr.each do |position_index|
         
      temp << @board[position_index]
      end
     
    if temp.all? {|token| token == "X" } || temp.all? {|token| token == "O" }
      result = combo_arr
    else
      temp = []
     #binding.pry
    end
  end
    result
end

def full?
  @board.all? {|token| token == "X" || token == "O"}
end

def draw?
  full? && !won?
end

def over?
  #binding.pry
  won? || full?
end

def winner
    #binding.pry
    if won?
      if @board[won?[0]] == "X"
        return "X"
      elsif  @board[won?[0]] == "O"
        return "O"
      end
    else
      return nil
    end
  end
  
def play
        while over? == false
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        else 
            puts "Cat's Game!"
        end
    end
end