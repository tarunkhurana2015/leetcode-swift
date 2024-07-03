import Foundation

public struct Stack<Type> {
    private var storage: [Type] = []
    
    public init(_ elements: [Type]) {
        storage = elements
    }
    
    public init() {
        
    }
    
    public func isEmpty() -> Bool {
        return storage.count == 0
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Type...) {
        storage = elements
    }
}

extension Stack: CustomStringConvertible {
    
    public var description: String {
        "\(storage.map{ "\($0)" }.reversed().joined(separator: "-") )"
    }
}


extension Stack {
    
    public mutating func push(_ element: Type) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Type? {
        storage.popLast()
    }
    
    public func last() -> Type? {
        storage.last
    }
}


