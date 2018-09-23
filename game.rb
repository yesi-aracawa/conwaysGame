require 'matrix'

class GameOfLife
    $matrix = []
    $aux = []
    def initialize(cols, rows)
        $matrix = Matrix.build(rows, cols) { ' ' }
        $aux = Matrix.build(rows, cols) { ' ' }
        return
    end

    def gotoxy(x, y)
        system("tput cup #{y} #{x}")
    end
    
    def itDestinyIs(r, c)
        columns = $matrix.column_count
        count = 0
        if r-1 >= 0
            if c-1 >= 0 && $matrix[r - 1, c - 1] == '*' #1
                count+=1
            end
            if c < columns && $matrix[r - 1, c] == '*' #2
                count+=1
            end
            if c+1 < columns && $matrix[r - 1, c + 1] == '*' #3
                count+=1
            end
        end
        if c-1 >= 0 && $matrix[r, c - 1] == '*' #4
            count+=1
        end
        if c+1 < columns && $matrix[r, c + 1] == '*' #6
            count+=1
        end
        if r+1 < $matrix.row_count
            if c-1 >= 0 && $matrix[r + 1, c - 1] == '*' #7
                count+=1
            end
            if c < columns && $matrix[r + 1, c] == '*' #8
                count+=1
            end
            if c+1 < columns && $matrix[r + 1, c + 1] == '*' #9
                count+=1
            end
        end
        
        if count == 3
            return '*'
        elsif count == 2 && $matrix[r, c] == '*'
            return '*'
        end
        return ' '
    end

    def frame
        system("tput clear")

        print 201.chr + "-"*$matrix.column_count + 200.chr
        (0..($matrix.row_count-1)).each do |r|
            gotoxy(0, r+1)
            print "|"
            (0..($matrix.column_count-1)).each do |c|
                gotoxy(c+1, r+1)
                # seed random
                if rand(2) == 1
                    # $matrix[r, c] = '*'
                    $matrix.send(:[]=, r, c, '*')
                else
                    # $matrix[r, c] = ' '
                    $matrix.send(:[]=, r, c, ' ')
                end
                print $matrix[r, c]
            end
            gotoxy($matrix.column_count+2, r+1)
            print "|"
        end
        gotoxy(0, $matrix.row_count+1)
        print 188.chr + "-"*$matrix.column_count + 187.chr
    end

    def play
        # ocultar cursor
        while true do
            (0..($matrix.row_count-1)).each do |r|
                (0..($matrix.column_count-1)).each do |c|
                    gotoxy(c+1, r+1)
                    print $matrix[r,c]
                    #$aux[r,c] = itDestinyIs(r, c)
                    $aux.send(:[]=, r, c, itDestinyIs(r, c))
                end
            end
            # new values
            (0..($matrix.row_count-1)).each do |r|
                (0..($matrix.column_count-1)).each do |c|
                    #$matrix[r,c] = $aux[r,c]
                    $matrix.send(:[]=, r, c, $aux[r,c])
                end
            end
        end
    end

    def start
        frame
        play
    end
end