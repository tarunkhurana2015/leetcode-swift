import UIKit

func desingerPDFViewer(heights: [Int], word: String) -> Int {
    
    var maxHeight = 0
    for char in word {
        let index = Int(char.asciiValue!) - 97
        maxHeight = max(maxHeight, heights[index])
    }
    return maxHeight*word.count
}

// Example usage:
let heights = [1, 3, 1, 3, 1, 4, 1, 3, 2, 1, 4, 1, 3, 1, 3, 1, 4, 1, 4, 2, 3, 4, 1, 2, 1, 2]
let word = "zebra"
print(desingerPDFViewer(heights: heights, word: word)) // Output will depend on the heights array and the word chosen
