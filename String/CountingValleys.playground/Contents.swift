/*
 An avid hiker keeps meticulous records of their hikes. During the last hike that took exactly  steps, for every step it was noted if it was an uphill, , or a downhill,  step. Hikes always start and end at sea level, and each step up or down represents a  unit change in altitude. We define the following terms:

 A mountain is a sequence of consecutive steps above sea level, starting with a step up from sea level and ending with a step down to sea level.
 A valley is a sequence of consecutive steps below sea level, starting with a step down from sea level and ending with a step up to sea level.
 Given the sequence of up and down steps during a hike, find and print the number of valleys walked through.

 Example

  

 The hiker first enters a valley  units deep. Then they climb out and up onto a mountain  units high. Finally, the hiker returns to sea level and ends the hike.

 Function Description

 Complete the countingValleys function in the editor below.

 countingValleys has the following parameter(s):

 int steps: the number of steps on the hike
 string path: a string describing the path
 Returns

 int: the number of valleys traversed
 */

func countingValleys(steps: Int, path: String) -> Int {
    
    var valleyCount = 0
        
    var upCount = 0
    var downCount = 0
    var inValley = false
    
    for step in path {
        
        if step == "U" {
            upCount += 1
            
            if inValley {
                if upCount + downCount == 0 {
                    valleyCount += 1
                    inValley = false
                }
            }
        } else if step == "D" {
            downCount -= 1
            
            if upCount + downCount < 0 {
                inValley = true
            } else {
                inValley = false
            }
        }
    }
    
    return valleyCount
}

let count = countingValleys(steps: 8, path: "UDDDUDUU")
print(count)
