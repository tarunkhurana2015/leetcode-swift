
struct Stack<Type> {
    private var storage = [Type]()
    
    mutating func push(_ value: Type) {
        storage.append(value)
    }
    
    mutating func pop() -> Type? {
        storage.popLast()
    }
    
    var isEmpty: Bool {
        return storage.isEmpty
    }
}

func isValidParenthesis(_ str: String) -> Bool {
    
    var stack = Stack<String>()
    let validDict = ["(":")", "{":"}", "[": "]"]
    for character in str {
        
        if validDict.keys.contains(String(character)) {
            stack.push(String(character))
        } else {
            guard let poppedValue = stack.pop(),
                    let value = validDict[poppedValue],
                    value == String(character) else {
                return false
            }
        }
    }
    return stack.isEmpty
}

isValidParenthesis("({})}")

func isBalanced(inputString: String) -> Bool {

    var validDelimiters = ["(":")", "{": "}", "[": "]"]
    var stack = [String]()

    for char in inputString { // O(n)

        if validDelimiters.keys.contains(String(char)) { // (
            stack.append(String(char))
        } else if validDelimiters.values.contains(String(char)) {
            
            guard let poppedChar = stack.popLast(),
                let delimiterValue = validDelimiters[poppedChar],
                delimiterValue == String(char) else {
                  return false
                }
        }
    }
    if stack.count != 0 {
      return false
    }
    return true
}


// SHOULD BE TRUE
print("=== SHOULD BE TRUE ===")
print(isBalanced(inputString: "()[]{}"))
print(isBalanced(inputString: "([{}])"))
print(isBalanced(inputString: "([] {})"))

// SHOULD BE FALSE
print("=== SHOULD BE FALSE ===")
print(isBalanced(inputString: "([)] ([)]"))
print(isBalanced(inputString: "([]"))
print(isBalanced(inputString: "[])"))
print(isBalanced(inputString: "([})"))
