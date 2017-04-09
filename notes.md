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
............
.....#......
.....#...#..
..oXX#..#*..
....X#...XXX
....X######X
....XXXXXXXX
[[3, 9], [3, 9], [4, 9], [4, 10], [4, 11], [5, 11], [6, 11], [6, 10], [6, 9], [6, 8], [6, 7], [6, 6], [6, 5], [6, 4], [5, 4], [4, 4], [3, 4], [3, 3], [3, 2]]

We found the goal! Here's the path we took!
............
.oXXX.......
....X.......
....X#......
....XXXXXX..
.........*..
............
[[5, 9], [5, 9], [4, 9], [4, 8], [4, 7], [4, 6], [4, 5], [4, 4], [3, 4], [2, 4], [1, 4], [1, 3], [1, 2], [1, 1]]

Depth-First Search appears to act like how a human would solve a maze. It will exhaust one avaliable route before moving onto the next possible route. It looks much cooler in visualizations, but is much less efficent than BFS.

### Breadth-First Final Route
We found the goal! Here's the path we took!
..XXXXX.....
..X..#X.....
..X..#X..#..
..o..#X.#*..
.....#XXXX..
.....######.
............
[[3, 9], [3, 9], [4, 9], [4, 8], [4, 7], [4, 6], [3, 6], [2, 6], [1, 6], [0, 6], [0, 5], [0, 4], [0, 3], [0, 2], [1, 2], [2, 2], [3, 2]]


We found the goal! Here's the path we took!
............
.o..........
.X..........
.X...#......
.X..........
.XXXXXXXX*..
............
[[5, 9], [5, 9], [5, 8], [5, 7], [5, 6], [5, 5], [5, 4], [5, 3], [5, 2], [5, 1], [4, 1], [3, 1], [2, 1], [1, 1]]

Breadth-First is more efficent than Depth-First because it is trying out all possible nodes, each level at a time, and then breaking when it finds an exit. It explores all the nodes, which is almost certainly *not* how humans solve mazes, but it does successfully solve a maze.