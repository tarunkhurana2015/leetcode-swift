import UIKit

func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
    
    var justifiedWords = [String]()
    
    var array = [String]()
    var wordCount = 0
    var wordLength = maxWidth
    
    for (index, word) in words.enumerated() {
                
        // Iterate through the words until the worldLength max out
        if (wordLength - word.count - wordCount) >= 0 {
            array.append(word)
            wordLength -= word.count
            wordCount += 1
        } else { // justify the line
            let length = array.reduce(0) { $0 + $1.count }
            let count = wordCount > 1 ? (wordCount-1) : 1
            var extraSpaceBetweenWords = (maxWidth - length)/count
            justifiedWords.append(justifyLine(array, extraSpaceBetweenWords, maxWidth))
            print(justifiedWords)
            
            // reset for the next iteration
            array = [String]()
            array.append(word)
            wordLength = maxWidth - word.count
            wordCount = 1
        }
        
    }
    
    let length = array.reduce(0) { $0 + $1.count }
    let count = wordCount > 1 ? (wordCount-1) : 1
    var extraSpaceBetweenWords = (maxWidth - length)/count
    justifiedWords.append(justifyLine(array, extraSpaceBetweenWords, maxWidth))
    
    
    return justifiedWords
}

func justifyLine(_ words:[String], _ spacing: Int, _ maxWidth: Int) -> String {
    var justifiedWords = ""
    for subWord in words {
        justifiedWords += subWord
        if justifiedWords.count + spacing < maxWidth {
            justifiedWords += String(repeating: " ", count: spacing)
        }
    }
    justifiedWords.append(String(repeating: " ", count: maxWidth - justifiedWords.count))
    print("\(justifiedWords) - \(justifiedWords.count)")
    return justifiedWords
}

let words = ["This", "is", "an", "example", "of", "text", "justification."]
//let words = ["What","must","be","acknowledgment","shall","be"]
//let words = ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"]
print(fullJustify(words, 16))
