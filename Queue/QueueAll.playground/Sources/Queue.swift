import Foundation

public struct Queue<Type> {
    private var storage: [Type] = []
    
    public init() { }
    
    public var isEmpty: Bool {
        storage.isEmpty
    }
    
    
}

extension Queue: CustomStringConvertible {
    public var description: String {
        String(describing: storage)
    }
}

extension Queue {
    
    public mutating func enqueue(_ element: Type) {
        storage.append(element)
    }
    
    public mutating func dequeue() -> Type? {
        isEmpty ? nil : storage.removeFirst()
    }
}
