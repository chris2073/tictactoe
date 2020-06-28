class Game
    attr_reader :board
    def initialize
        @board = ["1","2","3","4","5","6","7","8","9"]
        @board_values = [" "," "," "," "," "," "," "," "," "]
        @separator = "    -----------"

        def board
            return @board
        end

        def draw_board_picture
            puts "Name of slots"
            puts "     #{board[0]} | #{board[1]} | #{board[2]} "
            puts @separator
            puts "     #{board[3]} | #{board[4]} | #{board[5]} "
            puts @separator
            puts "     #{board[6]} | #{board[7]} | #{board[8]} "
        end

        def draw_board
            puts "    #{@board_values[0]} | #{@board_values[1]} | #{@board_values[2]} "
            puts @separator
            puts "    #{@board_values[3]} | #{@board_values[4]} | #{@board_values[5]} "
            puts @separator
            puts "    #{@board_values[6]} | #{@board_values[7]} | #{@board_values[8]} "

            puts @board_values[5] == "x" || "o"
        end

        def make_move(player, space)
            @board_values[space] = player
            draw_board
        end

        def check_win(player)
            if @board_values[0] == (player) && @board_values[1] == (player) && @board_values[2] == (player)
                return true
            elsif @board_values[0] == (player) && @board_values[3] == (player) && @board_values[6] == (player)
                return true
            elsif @board_values[6] == (player) && @board_values[7] == (player) && @board_values[8] == (player)
                return true
            elsif @board_values[2] == (player) && @board_values[5] == (player) && @board_values[8] == (player)
                return true
            elsif @board_values[0] == (player) && @board_values[4] == (player) && @board_values[8] == (player)
                return true
            elsif @board_values[6] == (player) && @board_values[4] == (player) && @board_values[2] == (player)
                return true
            elsif @board_values[1] == (player) && @board_values[4] == (player) && @board_values[7] == (player)
                return true
            elsif @board_values[3] == (player) && @board_values[4] == (player) && @board_values[5] == (player)
                return true
            else 
                return false
        end
    end

    
end
end

def player_x
    puts "Player 1, where would you like to play?"
    
    slot = gets.chomp.to_i
    $board.make_move("x", slot - 1)
    if $board.check_win("x")
        puts "Player 1 wins"
        exit
    end
end

def player_o
    puts "Player 2, where would you like to play?"
    
    slot = gets.chomp.to_i
    $board.make_move("o", slot - 1)
    if $board.check_win("o")
        puts "Player 2 wins"
        exit
    end
end






$board = Game.new
win = false
puts "// TIC - TAC - TOE \\"
puts $board.draw_board_picture

while win == false
player_x
player_o
end