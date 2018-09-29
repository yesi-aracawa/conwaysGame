require 'matrix'

class Conways_Game
    @matrix = []
    @aux = []
    def initialize(cols, rows)
        @matrix = Matrix.build(rows, cols) { ' ' }
        @aux = Matrix.build(rows, cols) { ' ' }
        return
    end

    def gotoxy(x, y)
        system("tput cup #{y} #{x}")
    end
    
    def it_Destiny_Is(row, col)
        columns = @matrix.column_count
        count = 0
        if row-1 >= 0
            if col-1 >= 0 && @matrix[row - 1, col - 1] == '*' #1
                count+=1
            end
            if col < columns && @matrix[row - 1, col] == '*' #2
                count+=1
            end
            if col+1 < columns && @matrix[row - 1, col + 1] == '*' #3
                count+=1
            end
        end
        if col-1 >= 0 && @matrix[row, col - 1] == '*' #4
            count+=1
        end
        if col+1 < columns && @matrix[row, col + 1] == '*' #6
            count+=1
        end
        if row+1 < @matrix.row_count
            if col-1 >= 0 && @matrix[row + 1, col - 1] == '*' #7
                count+=1
            end
            if col < columns && @matrix[row + 1, col] == '*' #8
                count+=1
            end
            if col+1 < columns && @matrix[row + 1, col + 1] == '*' #9
                count+=1
            end
        end
        
        if count == 3
            return '*'
        elsif count == 2 && @matrix[row, col] == '*'
            return '*'
        end
        return ' '
    end

    def frame
        system("tput clear")

        print 201.chrow + "-"*@matrix.column_count + 200.chr
        (0..(@matrix.row_count-1)).each do |row|
            gotoxy(0, row+1)
            print "|"
            (0..(@matrix.column_count-1)).each do |col|
                gotoxy(col+1, row+1)
                # seed random
                if rand(2) == 1
                    # @matrix[row, col] = '*'
                    @matrix.send(:[]=, row, col, '*')
                else
                    # @matrix[row, col] = ' '
                    @matrix.send(:[]=, row, col, ' ')
                end
                print @matrix[row, col]
            end
            gotoxy(@matrix.column_count+2, row+1)
            print "|"
        end
        gotoxy(0, @matrix.row_count+1)
        print 188.chrow + "-"*@matrix.column_count + 187.chr
    end

    def play
        # hide cursor
        while true do
            (0..(@matrix.row_count-1)).each do |row|
                (0..(@matrix.column_count-1)).each do |col|
                    gotoxy(col+1, row+1)
                    print @matrix[row,col]
                    #@aux[row,col] = it_Destiny_Is(row, col)
                    @aux.send(:[]=, row, col, it_Destiny_Is(row, col))
                end
            end
            # new values
            (0..(@matrix.row_count-1)).each do |row|
                (0..(@matrix.column_count-1)).each do |col|
                    #@matrix[row,col] = @aux[row,col]
                    @matrix.send(:[]=, row, col, @aux[row,col])
                end
            end
        end
    end

    def start
        frame
        play
    end
end