class CreateBoard
  
  #def numbers_to_markers

  def display_row(array)
    joined = array.join(" ")
  end

  def display_board()
    first_row = @board[0, 3]
    second_row = @board[3, 3]
    third_row = @board[6, 3]
    puts display_row(first_row)
    puts display_row(second_row)
    puts display_row(third_row)
  end

  def check_for_win(marker)
    if @board[0, 2].all?{|board_marker| board_marker == marker}
      puts "#{marker} wins"
    
    elsif @board[3, 5].all?{|board_marker| board_marker == marker}
      puts "#{marker} wins"

    elsif @board[6, 8].all?{|board_marker| board_marker == marker}
      puts "#{marker} wins"
    
    elsif @board[0] == marker && @board[3] == marker && @board[6] == marker
      puts "#{marker} wins"

    elsif @board[1] == marker && @board[4] == marker && @board[7] == marker
      puts "#{marker} wins"

    elsif @board[2] == marker && @board[5] == marker && @board[8] == marker
      puts "#{marker} wins"
    
    elsif @board[0] == marker && @board[4] == marker && @board[8] == marker
      puts "#{marker} wins"

    elsif @board[2] == marker && @board[4] == marker && @board[6] == marker
      puts "#{marker} wins"

    else
      if marker == "O"
        puts "X player make your next move"
      else
        puts "O player make your next move"
      end

    end
  end

  def add_mark(player, position)
    if @board[position] == " "
      @board[position] = player
      self.display_board
      
    else
      puts "choose again"
      self.display_board
    end
  end
end

class Game < CreateBoard
  def initialize
    @counter = 1
    @board = Array.new(9, " ")
  end

  def game_counter
    @counter +=1
  end

  def player_one(position)
    if @counter.odd?
      add_mark("X", position)
      check_for_win("X")
      game_counter()
    else
      puts "not your turn"
    end
  end

  def player_two(position)
    if @counter.even?
      add_mark("O", position)
      check_for_win("O")
      game_counter()
    else
      puts "not your turn"
    end
  end
end

game = Game.new()
p game
game.player_one(0)
game.player_two(2)
game.player_two(1)
game.player_one(4)
game.player_two(2)
game.player_two(3)
game.player_one(8)


