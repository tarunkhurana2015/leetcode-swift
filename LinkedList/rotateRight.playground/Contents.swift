import UIKit

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
    var isEmpty: Bool {
        next == nil
    }
}

extension Node: CustomStringConvertible {
    
    var description: String {
        guard let node = next else {
            return "\(value) -> null"
        }
        return "\(value) -> \(node)"
    }
}

struct LinkedList<T> {
    var node: Node<T>?
}
extension LinkedList : CustomStringConvertible {
    var description: String {
        guard let node = node else {
            return "empty list"
        }
        return "\(node)"
    }
    
    mutating func addNode(_ value: T) {
        let newNode = Node(value: value)
        if node == nil {
            node = newNode
        } else {
            var head = node
            while head?.next != nil {
                head = head?.next
            }
            head?.next = newNode
        }
    }
}

extension LinkedList {
    func rotateRight(_ k: Int) -> Node<T>? {
        
        guard let head = node else { return nil }
        
        var length = 1
        var tail: Node? = head
        
        while tail?.next != nil {
            length += 1
            tail = tail?.next
        }
        // tail 5->nil
        
        let k = k % length
        if k == 0 { return head }
        
        var newTail: Node<T>? = head
        for _ in 0..<(length - k - 1) { // 5 - 2- 1 = 2
            newTail = newTail?.next
        }
        // 3->4->5->nil
        
        let newHead = newTail?.next // 4->5->nil
        newTail?.next = nil // 3->nil
        tail?.next = head // 4>5>1>2>3>nil
        
        return newHead
        
    }
}


var list = LinkedList<Int>()
list.addNode(1)
list.addNode(2)
list.addNode(3)
list.addNode(4)
list.addNode(5)
print(list)

let head = list.rotateRight(2)
print(head!)
print(list)
extension LinkedList {
    
    // currenthead = 1->2->3->4->nil
    // reversehead = nil
    
    // next = 2->3->4->nil
    // currenthead->next = 1->nil
    // reversehead = 1->nil
    // currenthead = 2->3->4->nil
    
    // next = 3->4->nil
    // currenthead->next = 2->1->nil
    // reverhead = 2->1->nil
    // currenthead = 3->4->nil
    
    mutating func reverse() {
        var currentHead = node
        var reverseHead: Node<T>? = nil
        while currentHead != nil {
            let next = currentHead?.next
            currentHead?.next = reverseHead
            reverseHead = currentHead
            currentHead = next
        }
    }
}


