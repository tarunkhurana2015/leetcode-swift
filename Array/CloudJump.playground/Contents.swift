/*
 There is a new mobile game that starts with consecutively numbered clouds. Some of the clouds are thunderheads and others are cumulus. The player can jump on any cumulus cloud having a number that is equal to the number of the current cloud plus  or . The player must avoid the thunderheads. Determine the minimum number of jumps it will take to jump from the starting postion to the last cloud. It is always possible to win the game.

 For each game, you will get an array of clouds numbered  if they are safe or  if they must be avoided.

 Example

 Index the array from . The number on each cloud is its index in the list so the player must avoid the clouds at indices  and . They could follow these two paths:  or . The first path takes  jumps while the second takes . Return .

 Function Description

 Complete the jumpingOnClouds function in the editor below.

 jumpingOnClouds has the following parameter(s):

 int c[n]: an array of binary integers
 Returns

 int: the minimum number of jumps required
 */

func jumpingOnClouds(c: [Int]) -> Int {
    var totalJumps = 0
    var index = 0
    
    while index < c.count - 1 {
        if index+2 < c.count && c[index + 2] == 0 { // safe to jump
            index += 2
        } else {
            index += 1
        }
        totalJumps += 1
    }
    
    return totalJumps
}
let clouds = [0, 1, 0, 0, 0, 1, 0]
print(jumpingOnClouds(c: clouds))
