/*
 It is New Year's Day and people are in line for the Wonderland rollercoaster ride. Each person wears a sticker indicating their initial position in the queue from  to . Any person can bribe the person directly in front of them to swap positions, but they still wear their original sticker. One person can bribe at most two others.

 Determine the minimum number of bribes that took place to get to a given queue order. Print the number of bribes, or, if anyone has bribed more than two people, print Too chaotic.

 Example


 If person  bribes person , the queue will look like this: . Only  bribe is required. Print 1.


 Person  had to bribe  people to get to the current position. Print Too chaotic.

 Function Description

 Complete the function minimumBribes in the editor below.

 minimumBribes has the following parameter(s):

 int q[n]: the positions of the people after all bribes
 Returns

 No value is returned. Print the minimum number of bribes necessary or Too chaotic if someone has bribed more than  people.
 */

func minimumBribes(q: [Int]) {
    
    var totalBribes = 0
    
    for index in 0..<q.count-1 {
        if q[index + 1] - q[index] < -2 {
            print("Too chacotic")
            return
        } else if q[index + 1] - q[index] <= -1 {
            totalBribes += (q[index] - q[index+1])
            print(totalBribes)
        }
    }
    print(totalBribes)
}

//minimumBribes(q: [1,2,3,5,4,6,7,8])
//minimumBribes(q: [4,1,2,3])
//minimumBribes(q: [2,1,5,3,4])
//minimumBribes(q: [5,1,2,3,7,8,6,4])
minimumBribes(q: [2,1,5,3,7,8,6,4])
                // 0 0 2 0 2 8 0
