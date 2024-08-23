import UIKit

func convert(_ s: String, _ numRows: Int) -> String {
    
    guard numRows > 1 else { return s }
    
    var rows = Array(repeating: "", count: min(numRows, s.count))
    var index = 0
    var step = -1
    
    for char in s {
        rows[index] += String(char)
        
        if index == 0 {
            step = 1
        } else if index == numRows - 1 {
            step = -1
        }
        
        index += step
    }
    
    print(rows)
    
    return rows.joined()
    
}
// Example usage
let input = "PAYPALISHIRING"
let numRows = 3
let result = convert(input, numRows)
print(result) // Output: "PAHNAPLSIIGYIR"

""
