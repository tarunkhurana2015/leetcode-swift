import Foundation

public struct QueueStack<Type> {
    private var enqueueStack = [Type]()
    private var dequeueStack = [Type]()
    
    public init() {
        
    }
    
    public mutating func enqueue(_ element: Type) {
        
        while let dequeueElement = dequeueStack.popLast() {
            enqueueStack.append(dequeueElement)
        }
        enqueueStack.append(element)
    }
    
    public mutating func dequeue() -> Type? {
        
        while let enqueueElement = enqueueStack.popLast() {
            dequeueStack.append(enqueueElement)
        }
        return dequeueStack.popLast()
    }
}

extension QueueStack {
    public var description: String {
        String(describing: enqueueStack + dequeueStack) 
    }
}

