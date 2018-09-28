# CONWAY'S GAME OF LIFE

### HISORY
<section class=text-justify>
The Game of Life was invented in 1970 by the British mathematician John Horton Conway. Conway developed an interest in a problem which was made evident in the 1940’s by mathematician John von Neumann, who aimed to find a hypothetical machine that had the ability to create copies of itself and was successful when he discovered a mathematical model for such a machine with very complicated rules on a rectangular grid. Thus, the Game of Life was Conway’s way of simplifying von Neumann’s ideas. It is the best-known example of a cellular automaton which is any system in which rules are applied to cells and their neighbors in a regular grid. Martin Gardner popularized the Game of Life by writing two articles for his column “Mathematical Games” in the journal Scientific American in 1970 and 1971. 
</section>

### RULES

 1) Any live cell with fewer than two live neighbors dies, as if caused by underpopulation.
 2) Any live cell with more than three live neighbors dies, as if by overcrowding.
 3) Any live cell with two or three live neighbors lives on to the next generation.
 4) Any dead cell with exactly three live neighbors becomes a live cell.

 ### THIS GEM 
<section class=text-justify>
The gem of this game allows you to see the operation in a way that does not request any value from the user.
The only thing that needs is to execute it with the commands that appear in this document.
Broadly shows the visual effect that the game generates.
In each version appear different effects what makes it striking.
</section>

#### INSTALL AND USE THIS GEM

<section class=text-justify>
Depending on the way you want to install it, you need ruby ​​preferably in version 2.3.x onwards and if you use docker, this gem was made with docker tools but the command works with docker directly.
</section>

>DOCKER 
<pre><code>docker run --rm -it -v $(pwd):/app -w /app ruby sh -c "gem install CONWAYSGAME.gem && ruby  main.rb" </code></pre> 
$(pwd) = 
address where you have the project 
>USUALLY
<pre><code>gem install CONWAYSGAME.gem 
ruby  main.rb</code></pre> 

### Some Code Description

*  Initialization of matrix and content, receives as parameters the rows and columns that are already predefined.
```
 def initialize(cols, rows)
        @matrix = Matrix.build(rows, cols) { ' ' }
        @aux = Matrix.build(rows, cols) { ' ' }
        return
    end
```
* As shown in the code, the function is only responsible for drawing the coordinates that it receives or, better said, for positioning them.

```
 def gotoxy(x, y)
        system("tput cup #{y} #{x}")
    end
```
* This function receives the rows and columns to be in charge of analyzing the rules and drawing limits or cells depending on the conditions.

<pre><code>it_Destiny_Is(row, col)</code></pre> 

