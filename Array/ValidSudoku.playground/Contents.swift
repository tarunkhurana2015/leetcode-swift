
func isValidSudoku(_ board: [[Character]]) -> Bool {

    var rows = Array(repeating: Set<Character>(), count: 9)
    var columns = Array(repeating: Set<Character>(), count: 9)
    var boxes = Array(repeating: Set<Character>(), count: 9)
    
    
    for i in 0..<rows.count {
        for j in 0..<columns.count {
            
            let value = board[i][j]
            if value == "." {
                continue
            }
            
            if rows[i].contains(value) {
                return false
            }
            rows[i].insert(value)
            
            if columns[j].contains(value) {
                return false
            }
            columns[j].insert(value)
            
            let boxIndex = (i / 3) * 3 + (j / 3)
            if boxes[boxIndex].contains(value) {
                return false
            }
            boxes[boxIndex].insert(value)
        }
    }
    
    print(rows)
    print(columns)
    print(boxes)
    return true
}
let board: [[Character]] = [
    ["5","3",".",".","7",".",".",".","."],
    ["6",".",".","1","9","5",".",".","."],
    [".","9","8",".",".",".",".","6","."],
    ["8",".",".",".","6",".",".",".","3"],
    ["4",".",".","8",".","3",".",".","1"],
    ["7",".",".",".","2",".",".",".","6"],
    [".","6",".",".",".",".","2","8","."],
    [".",".",".","4","1","9",".",".","5"],
    [".",".",".",".","8",".",".","7","9"]
]

print(isValidSudoku(board))
