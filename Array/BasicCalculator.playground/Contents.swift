import UIKit

extension Character {
    
    var isOperator: Bool {
        "/*+-".contains(self)
    }
}
func calculate(_ equation: String) -> Int {
    
    var result = 0
    var operand = 0
    var sign = 1
    
    for char in equation {
        switch char {
        case "0"..."9":
            operand = operand * 10 + Int(String(char))!
        case "+":
            result += sign * operand
            operand = 0
            sign = 1
        case "-":
            result += sign * operand
            operand = 0
            sign = -1
        default:
            break
        }
    }
    
    result += sign * operand
    return result
}


let calculation = calculate("500+5-5")
