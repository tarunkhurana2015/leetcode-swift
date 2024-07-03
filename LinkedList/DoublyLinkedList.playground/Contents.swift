import UIKit

class Node<T> {
    var value: T
    var next: Node?
    var prev: Node?
    
    init(value: T) {
        self.value = value
    }
}
extension Node: CustomStringConvertible {
    var description: String {
        guard let node = next else {
            return "\(value)"
        }
        return "\(value) -> \(node)"
    }
}


struct DoublyLinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
}
extension DoublyLinkedList: CustomStringConvertible {
    var description: String {
        guard let node = head else {
            return "Empty List"
        }
        return "\(node)"
    }
}

extension DoublyLinkedList {
    mutating func addNodeToHead(_ value: T) {
        let newNode = Node(value: value)
        newNode.next = head
        newNode.prev = nil
        head?.prev = newNode
        head = newNode
        if head?.next == nil {
            tail = head
        }
    }
    mutating func addNodeToTail(_ value: T) {
        let newNode = Node(value: value)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
        if tail?.prev == nil {
            head = tail
        }
    }
    mutating func removeHeadNode() {
        head = head?.next
        head?.prev = nil
        if head == nil {
            tail = nil
        }
    }
    mutating func removeTailNode() {
        tail = tail?.prev
        tail?.next = nil
        if tail == nil {
            head = nil
        }
    }
}

var ddll = DoublyLinkedList<Int>()
ddll.addNodeToHead(1)
ddll.addNodeToHead(2)
ddll.addNodeToHead(3)
ddll.addNodeToTail(4)
ddll.addNodeToTail(5)

print(ddll)

ddll.removeHeadNode()
print(ddll)

ddll.removeTailNode()
ddll.removeTailNode()
ddll.removeTailNode()
ddll.removeTailNode()
print(ddll)
