/*
 There is a large pile of socks that must be paired by color. Given an array of integers representing the color of each sock, determine how many pairs of socks with matching colors there are.

 Example


 There is one pair of color  and one of color . There are three odd socks left, one of each color. The number of pairs is .

 Function Description

 Complete the sockMerchant function in the editor below.

 sockMerchant has the following parameter(s):

 int n: the number of socks in the pile
 int ar[n]: the colors of each sock
 Returns

 int: the number of pairs
 Input Format

 The first line contains an integer , the number of socks represented in .
 The second line contains  space-separated integers, , the colors of the socks in the pile.
 */

func sockMerchant(n: Int, ar: [Int]) -> Int {
    var pairCount = 0
    
    var dict = [Int: Int]()
    
    for color in ar {
        if let value = dict[color] {
            if value == 2 {
                dict[color] = 1
            } else {
                dict[color]! += 1
                if dict[color] == 2 {
                    pairCount += 1
                }
            }
        } else {
            dict[color] = 1
        }
    }
    
    return pairCount
}

let count = sockMerchant(n: 7, ar: [1,2,1,2,1,3,2])
print(count)


let count1 = sockMerchant(n: 9, ar: [10, 20, 20, 10, 10, 30, 50, 10, 20])
print(count1)
