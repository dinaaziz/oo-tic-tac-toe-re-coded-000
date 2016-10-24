class TicTacToe
  def initialize(board=[" "," "," ", " ", " "," "," "," "," "])
    @board = board
  end
  #طريقة ثانية
#  def initialize(board = nil)
#    @board = board || Array.new(9, " ")
#  end
#طريقة ثالثة
#def initialize
#@board= Array.new(9," ")
#end

  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  #طريقة ثانية : we can put this method if we didn't want to put @ in front of every board in array
  #def board
  #@board
#end

  def move(location, value="X")
    @board[location.to_i-1]=value
  end
  def position_taken?(index)
    if @board[index]==" "
      false
    elsif @board[index]==""
      false
    elsif @board[index]== nil
      false
    elsif @board[index]== "X" || @board[index]== "O"
      true
    end
  end
  def valid_move?(position)
    if position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
      true
    else
      false
    end
  end
    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      if valid_move?(input)
        move(input, current_player)
        display_board
      else
        turn
      end
end
      def turn_count
        @board.count{|token| token == "X" || token == "O"}
      end
      def current_player
    if    turn_count%2==0
        return "X"
      else return "O"
      end
    end
      def won?
        WIN_COMBINATIONS.detect do |combo|
          @board[combo[0]]==@board[combo[1]] && @board[combo[1]]==@board [combo[2]] && position_taken?(combo[0])
        end
      end
def full?
@board.all? do |item|
 item=="X" || item=="O"
 end
 end
 def draw?
   full? && !won?
 end

 def over?
   draw? || won?
 end
 def winner
   combo=won?
   if combo
     return @board[combo[2]]    #يصير نحط 0او 1 او 2 لانها كلها متساوية
   end
end

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cats Game!"
end
end
end
