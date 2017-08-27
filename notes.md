 * Why do your strategies still work in an open map?

It still works because both BFS and DFS explores all nodes.

* Are BFS and DFS searching efficiently? Why or why not?

No. They are focused on exploring all nodes, not the nodes that are most likely to lead to the end. It is essentially running around the map until it finds it.

* How do your strategies differ visually on the more open map?

In a more closed map, the computer's options for exploring the map are limited by the walls. So the computer behaves more "rationally" than in an open map, where the computer is free-er to explore the map.

* Theoretically, what would you _like_ to be able to do to make your search more efficient? Don't worry about "how" yet.

I want the computer to know the distance between where it currently is and the exit *and* the direction of the exit. The computer will attempt to move directly to the exit, and will only deviate from that path if something is blocking its path, like a wall


## Test It OUT!

### Depth-First Final Route
We found the goal! Here's the path we took!
............
.....#......
.....#...#..
..oXX#..#*..
....X#...XXX
....X######X
....XXXXXXXX
[[3, 9], [4, 9], [4, 10], [4, 11], [5, 11], [6, 11], [6, 10], [6, 9], [6, 8], [6, 7], [6, 6], [6, 5], [6, 4], [5, 4], [4, 4], [3, 4], [3, 3], [3, 2]]
Tiles Explored: 66
Length of Path: 18

We found the goal! Here's the path we took!
............
.oXXX.......
....X.......
....X#......
....XXXXXX..
.........*..
............
[[5, 9], [4, 9], [4, 8], [4, 7], [4, 6], [4, 5], [4, 4], [3, 4], [2, 4], [1, 4], [1, 3], [1, 2], [1, 1]]
Tiles Explored: 69
Length of Path: 13

Depth-First Search appears to act like how a human would solve a maze. It will exhaust one avaliable route before moving onto the next possible route. It looks much cooler in visualizations, but is much less efficent than BFS.

We found the goal! Here's the path we took!
#######################
#.....................#
#................#....#
#...o............#....#
#XXXX............#....#
#X...............#....#
#X...............#....#
#X...............#....#
#X...............#....#
#X...............#....#
#X...............#....#
#X...............#....#
#X...............#....#
#X...............#....#
#X...............#....#
#X...............#....#
#X...............#....#
#X...............#....#
#X...............#....#
#X...............#....#
#X...............#....#
#X...............#....#
#X...............#....#
#X################....#
#XXXXXXXXXXXXXXXX#....#
################X#....#
#XXXXXXXXXXXXXXXX#....#
#X################....#
#XXXXXXXXXXXXXXXXX*...#
#######################
[[28, 18], [28, 17], [28, 16], [28, 15], [28, 14], [28, 13], [28, 12], [28, 11], [28, 10], [28, 9], [28, 8], [28, 7], [28, 6], [28, 5], [28, 4], [28, 3], [28, 2], [28, 1], [27, 1], [26, 1], [26, 2], [26, 3], [26, 4], [26, 5], [26, 6], [26, 7], [26, 8], [26, 9], [26, 10], [26, 11], [26, 12], [26, 13], [26, 14], [26, 15], [26, 16], [25, 16], [24, 16], [24, 15], [24, 14], [24, 13], [24, 12], [24, 11], [24, 10], [24, 9], [24, 8], [24, 7], [24, 6], [24, 5], [24, 4], [24, 3], [24, 2], [24, 1], [23, 1], [22, 1], [21, 1], [20, 1], [19, 1], [18, 1], [17, 1], [16, 1], [15, 1], [14, 1], [13, 1], [12, 1], [11, 1], [10, 1], [9, 1], [8, 1], [7, 1], [6, 1], [5, 1], [4, 1], [4, 2], [4, 3], [4, 4], [3, 4]]
Tiles Explored: 496
Length of Path: 76

### Breadth-First Final Route
We found the goal! Here's the path we took!
..XXXXX.....
..X..#X.....
..X..#X..#..
..o..#X.#*..
.....#XXXX..
.....######.
............
[[3, 9], [4, 9], [4, 8], [4, 7], [4, 6], [3, 6], [2, 6], [1, 6], [0, 6], [0, 5], [0, 4], [0, 3], [0, 2], [1, 2], [2, 2], [3, 2]]
Tiles Explored: 84
Length of Path: 16

We found the goal! Here's the path we took!
............
.o..........
.X..........
.X...#......
.X..........
.XXXXXXXX*..
............
[[5, 9], [5, 8], [5, 7], [5, 6], [5, 5], [5, 4], [5, 3], [5, 2], [5, 1], [4, 1], [3, 1], [2, 1], [1, 1]]
Tiles Explored: 79
Length of Path: 13

Breadth-First is more efficent than Depth-First because it is trying out all possible nodes, each level at a time, and then breaking when it finds an exit. It explores all the nodes, which is almost certainly *not* how humans solve mazes, but it does successfully solve a maze.

We found the goal! Here's the path we took!
#######################
#...XXXXXXXXXXXXXXX...#
#...X............#X...#
#...o............#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#.################X...#
#................#X...#
################.#X...#
#................#X...#
#.################X...#
#.................*...#
#######################
[[28, 18], [27, 18], [26, 18], [25, 18], [24, 18], [23, 18], [22, 18], [21, 18], [20, 18], [19, 18], [18, 18], [17, 18], [16, 18], [15, 18], [14, 18], [13, 18], [12, 18], [11, 18], [10, 18], [9, 18], [8, 18], [7, 18], [6, 18], [5, 18], [4, 18], [3, 18], [2, 18], [1, 18], [1, 17], [1, 16], [1, 15], [1, 14], [1, 13], [1, 12], [1, 11], [1, 10], [1, 9], [1, 8], [1, 7], [1, 6], [1, 5], [1, 4], [2, 4], [3, 4]]
Tiles Explored: 607
Length of Path: 44

Screenshot of the Breadth-First in Action:

#######################
#XXXXXXXXXXXXXXXXXXXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXoXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXXX#
#XXXXXXXXXXXXXXXX#XXX.#
#XXXXXXXXXXXXXXXX#XX..#
#X################X...#
#XXXXXXXXXXXXXXX.#💻...#
################.#....#
#................#....#
#.################....#
#.................*...#
#######################

Dear God!

### Manhattan-First Final Route

We found the goal! Here's the path we took!
............
.....#......
.....#...#..
..oXX#..#*X.
....X#....XX
....X######X
....XXXXXXXX
[[3, 9], [3, 10], [4, 10], [4, 11], [5, 11], [6, 11], [6, 10], [6, 9], [6, 8], [6, 7], [6, 6], [6, 5], [6, 4], [5, 4], [4, 4], [3, 4], [3, 3], [3, 2]]
Tiles Explored: 42
Length of Path: 18

We found the goal! Here's the path we took!
............
.oXXXXXXXX..
.........X..
.....#...X..
.........X..
.........*..
............
[[5, 9], [4, 9], [3, 9], [2, 9], [1, 9], [1, 8], [1, 7], [1, 6], [1, 5], [1, 4], [1, 3], [1, 2], [1, 1]]
Tiles Explored: 37
Length of Path: 13

The Manhattan-First Approach resembles my belief on how to make search more efficent, due to it knowing where the "goal" is and always attempting to move closer to the goal.

We found the goal! Here's the path we took!
#######################
#.....................#
#................#....#
#...oXXX.........#....#
#......X.........#....#
#......XXXXXXXXXX#....#
#...............X#....#
#...............X#....#
#...............X#....#
#...............X#....#
#...............X#....#
#...............X#....#
#...............X#....#
#...............X#....#
#...............X#....#
#...............X#....#
#...............X#....#
#...............X#....#
#...............X#....#
#...............X#....#
#...............X#....#
#...............X#....#
#XXXXXXXXXXXXXXXX#....#
#X################....#
#XXXXXXXXXXXXXXXX#....#
################X#....#
#XXXXXXXXXXXXXXXX#....#
#X################....#
#XXXXXXXXXXXXXXXXX*...#
#######################
[[28, 18], [28, 17], [28, 16], [28, 15], [28, 14], [28, 13], [28, 12], [28, 11], [28, 10], [28, 9], [28, 8], [28, 7], [28, 6], [28, 5], [28, 4], [28, 3], [28, 2], [28, 1], [27, 1], [26, 1], [26, 2], [26, 3], [26, 4], [26, 5], [26, 6], [26, 7], [26, 8], [26, 9], [26, 10], [26, 11], [26, 12], [26, 13], [26, 14], [26, 15], [26, 16], [25, 16], [24, 16], [24, 15], [24, 14], [24, 13], [24, 12], [24, 11], [24, 10], [24, 9], [24, 8], [24, 7], [24, 6], [24, 5], [24, 4], [24, 3], [24, 2], [24, 1], [23, 1], [22, 1], [22, 2], [22, 3], [22, 4], [22, 5], [22, 6], [22, 7], [22, 8], [22, 9], [22, 10], [22, 11], [22, 12], [22, 13], [22, 14], [22, 15], [22, 16], [21, 16], [20, 16], [19, 16], [18, 16], [17, 16], [16, 16], [15, 16], [14, 16], [13, 16], [12, 16], [11, 16], [10, 16], [9, 16], [8, 16], [7, 16], [6, 16], [5, 16], [5, 15], [5, 14], [5, 13], [5, 12], [5, 11], [5, 10], [5, 9], [5, 8], [5, 7], [4, 7], [3, 7], [3, 6], [3, 5], [3, 4]]
Tiles Explored: 338
Length of Path: 100

## A* Final Route

We found the goal! Here's the path we took!
....XXXXXX..
....X#...XX.
....X#...#X.
..oXX#..#*X.
.....#......
.....######.
............
[[3, 9], [3, 10], [2, 10], [1, 10], [1, 9], [0, 9], [0, 8], [0, 7], [0, 6], [0, 5], [0, 4], [1, 4], [2, 4], [3, 4], [3, 3], [3, 2]]
Tiles Explored: 80
Length of Path: 16

We found the goal! Here's the path we took!
............
.oXX........
...X........
...XX#......
....X.......
....XXXXX*..
............
[[5, 9], [5, 8], [5, 7], [5, 6], [5, 5], [5, 4], [4, 4], [3, 4], [3, 3], [2, 3], [1, 3], [1, 2], [1, 1]]
Tiles Explored: 40
Length of Path: 13

We found the goal! Here's the path we took!
#######################
#...............XXX...#
#...............X#X...#
#...oXXXXXXXXXXXX#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#................#X...#
#.################X...#
#................#X...#
################.#X...#
#................#X...#
#.################X...#
#.................*...#
#######################
[[28, 18], [27, 18], [26, 18], [25, 18], [24, 18], [23, 18], [22, 18], [21, 18], [20, 18], [19, 18], [18, 18], [17, 18], [16, 18], [15, 18], [14, 18], [13, 18], [12, 18], [11, 18], [10, 18], [9, 18], [8, 18], [7, 18], [6, 18], [5, 18], [4, 18], [3, 18], [2, 18], [1, 18], [1, 17], [1, 16], [2, 16], [3, 16], [3, 15], [3, 14], [3, 13], [3, 12], [3, 11], [3, 10], [3, 9], [3, 8], [3, 7], [3, 6], [3, 5], [3, 4]]
Tiles Explored: 436
Length of Path: 44
