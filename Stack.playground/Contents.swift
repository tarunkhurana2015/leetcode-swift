import Foundation

struct Stack<T> {
    private var storage: [T] = []
    public init() {}

    public mutating func push(_ element: T) {
        storage.append(element)
    }

    @discardableResult
    public mutating func pop() -> T? {
        storage.popLast()
    }
}

extension Stack: ExpressibleByArrayLiteral {
typealias ArrayLiteralElement = T

  public init(arrayLiteral elements: ArrayLiteralElement...) {
    storage = elements
  }
}
extension Stack: CustomStringConvertible {
    public var description: String {
        """
        ----top----
        \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
        -----------
        """
      }
}

var stack = Stack<Int>()
  stack.push(1)
  stack.push(2)
  stack.push(3)
  stack.push(4)

   stack.pop()

var stack1: Stack = [1,2,3,4]
