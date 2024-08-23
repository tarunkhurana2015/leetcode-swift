/*
 You are given an integer array nums and an integer k.

 In one operation, you can pick two numbers from the array whose sum equals k and remove them from the array.

 Return the maximum number of operations you can perform on the array.
 */


func maxOperations(_ nums: [Int], _ k: Int) -> Int {
    
    var count = 0
    var dict = [Int: Int]()
    
    var nums1 = nums.sorted()
    for (index,num) in nums1.enumerated() {
        let diff =  k - num
        if let _ = dict[diff] {
            count += 1
            print("(\(num), \(diff))")
        }
        
        dict[num] = index
    }
    return count
}

maxOperations([1,2,3,4], 5)
maxOperations([3,1,3,4,3], 6)
