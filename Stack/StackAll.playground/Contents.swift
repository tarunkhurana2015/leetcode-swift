import UIKit

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
stack.description

stack.pop()
stack.pop()
stack.description


var stack1 = Stack(["A", "B", "C", "D"])
stack1.description


var stack2 = Stack([1.0, 2.0, 3.0, 4.0])
stack2.description


// Reverse An Array
func printInReverse<T>(_ array: [T]) {
    var stack = Stack<T>()
    
    for value in array {
        stack.push(value)
    }
    
    while let value = stack.pop() {
        print(value)
    }
    
}
printInReverse(["A", "B", "C", "D"])

// Balance the parentheses
func checkForBalancedParenteses(_ array: String) -> Bool {
    
    var stack4 = Stack<String>()
    
    for value in array {
        if value == "(" {
            stack4.push("(")
        } else if value == ")" {
            if stack4.isEmpty() {
                return false
            }
            stack4.pop()
        }
    }
    return stack4.isEmpty()
}

checkForBalancedParenteses("h((e))llo(world)()")

// Balance the brackets
func isBalanced(_ expression: String) -> Bool {
        
    var stack5 = Stack<Character>()
    let openingBrackets: Set<Character> = Set("({[")
    let closingBrackets: [Character: Character] = [")": "(",
                                                   "}": "{",
                                                   "]": "["]
    for bracket in expression {
        if openingBrackets.contains(bracket) {
            stack5.push(bracket)
        } else {
            if let lastBracket = stack5.last(), closingBrackets[bracket] == lastBracket {
                stack5.pop()
            } else {
                return false
            }
        }
    }    
    
    return stack5.isEmpty()
    
}

let expression1 = "{[()]}" // Balanced
let expression2 = "{[(])}" // Not balanced
print(isBalanced(expression1)) // Output: true
print(isBalanced(expression2)) // Output: false
