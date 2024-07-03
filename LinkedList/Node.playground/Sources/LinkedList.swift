import Foundation

public struct LinkedList<Type> {
    
    public var head: Node<Type>?
    public var tail: Node<Type>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

extension LinkedList {
    // push is the operation to push a node to the begunning of the linked list
    public mutating func push(_ value: Type) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
}

extension LinkedList {
    // append is the operation tp append the value to thenend of the list
    public mutating func append(_ value: Type) {
        if isEmpty {
            push(value)
            return
        }
        tail?.next = Node(value: value)
        tail = tail?.next
    }
}

extension LinkedList {
    public func node(at index: Int) -> Node<Type>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    public mutating func insert(_ value: Type, after node: Node<Type>) {
        
        guard tail !== node else {
            append(value)
            return
        }
        
        node.next = Node(value: value, next: node.next)
    }
}


extension LinkedList {
    public mutating func pop() -> Type? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
}

extension LinkedList {
    public mutating func removeLast() -> Type? {
        
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
    }
}

extension LinkedList {
    public mutating func remove(after node: Node<Type>) -> Type? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}
