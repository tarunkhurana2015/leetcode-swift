func maxSumSubarray(_ arr: [Int], _ k: Int) -> Int {
    var maxSum = 0
    var currentSum = 0

    // Sum of the first k elements
    for i in 0..<k {
        currentSum += arr[i]
    }
    maxSum = currentSum

    // Slide the window over the rest of the array
    for i in k..<arr.count {
        currentSum += arr[i] - arr[i - k]
        maxSum = max(maxSum, currentSum)
    }

    return maxSum
}


func lengthOfLongestSubstring(_ s: String) -> Int {
    var lastSeen = [Character: Int]()
    var maxLength = 0
    var start = 0

    for (i, char) in s.enumerated() {
        if let lastPos = lastSeen[char], lastPos >= start {
            start = lastPos + 1
        }
        lastSeen[char] = i
        maxLength = max(maxLength, i - start + 1)
    }

    return maxLength
}

func maxVowels(_ s: String, _ k: Int) -> Int {
    let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
    var maxVowelCount = 0
    var currentVowelCount = 0
    let characters = Array(s)
    
    // Count vowels in the first k-length substring
    for i in 0..<k {
        if vowels.contains(characters[i]) {
            currentVowelCount += 1
        }
    }
    maxVowelCount = currentVowelCount
    
    // Slide the window across the string
    for i in k..<characters.count {
        if vowels.contains(characters[i]) {
            currentVowelCount += 1
        }
        if vowels.contains(characters[i - k]) {
            currentVowelCount -= 1
        }
        maxVowelCount = max(maxVowelCount, currentVowelCount)
    }
    
    return maxVowelCount
}

