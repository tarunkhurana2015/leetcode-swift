import Foundation

public struct LinkedList<Type> {
    
    public var head: Node<Type>?
    
    public init() {
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        if isEmpty {
            return "Empty List"
        }
        return "\(String(describing: head))"
    }
}

extension LinkedList {
    
    public mutating func push(_ value: Type) {
        if isEmpty {
            head = Node(value: value)
        } else {
            head = Node(value: value, next: head)
        }
    }
    
    public mutating func addNode(_ node: Node<Type>) {
        if isEmpty {
            head = node
        } else {
            node.next = head
            head = node
        }
    }
    public mutating func addNodeEnd(_ node: Node<Type>) {
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = node
    }
}

extension LinkedList {
    public mutating func deleteNode(_ node: Node<Type>) {
        
        if head === node {
            head = node.next
        }
        
        var prev = head
        var current = head?.next
        
        while let next = current {
            if next === node {
                prev?.next = next.next
                break
            }
            prev = current
            current = current?.next
        }
    }
}

extension LinkedList {
    public mutating func removeNthFromEnd(_ n: Int) {
        
        let dummy: Node<Type>? = Node(value: 0 as! Type)
        dummy?.next = head
        
        var fast: Node<Type>? = dummy
        var slow: Node<Type>? = dummy
        for _ in 0..<n {
            fast = fast?.next
        }
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        slow?.next = slow?.next?.next
        
    }
}

extension LinkedList {
    public mutating func reverse() -> Node<Type>? {
        
        // pass 1
        // currentHead 1 -> 2 -> 3 -> 4 -> 5 -> nil
        // reverseHead = nil
        
        // pass 2
        // reverseHead = 1 -> nil
        // currentHead = 2 -> 3 -> 4 -> 5 -> nil
        
        // pass 3
        // reverseHead = 2 -> 1 -> nil
        // currentHead = 3 -> 4 -> 5 -> nil
        
        // pass 4
        // reverseHead = 3 -> 2 -> 1 -> nil
        // currentHead = 4 -> 5 -> nil
        
        // pass 5
        // reverseHead = 4 -> 3 -> 2 -> 1 -> nil
        // currentHead = 5 -> nil
        
        // pass 6
        // reverseHead = 5 -> 4 -> 3 -> 2 -> 1 -> nil
        // currentHead = nil
        
        var currentHead = head
        var reverseHead: Node<Type>? = nil
        
        while currentHead != nil {
            
            let tempHead = currentHead?.next
            currentHead?.next = reverseHead
            reverseHead = currentHead
            currentHead = tempHead
        }
        
        return reverseHead
        
    }
    
    public mutating func reverseRecursive(_ head: Node<Type>?) -> Node<Type>? {
        
        guard let current = head, let next = current.next else {
            return head
        }
        
        let reversedHead = reverseRecursive(next)
        next.next = current
        current.next = nil
        
        return reversedHead
    }
}

extension LinkedList {
    
    public mutating func sortMerge(_ head1: Node<Type>?, _ head2: Node<Type>?) -> Node<Type>? where Type == Int {
        
        let dummy: Node<Type>? = Node(value: 0)
        var current = dummy
        var currentHead1 = head1
        var currentHead2 = head2
        while let node1 = currentHead1, let node2 = currentHead2 {
            if node1.value < node2.value {
                current?.next = node1
                currentHead1 = node1.next
            } else {
                current?.next = node2
                currentHead2 = node2.next
            }
            current = current?.next
        }
        
        if let remainingNodes = currentHead1 ?? currentHead2 {
            current?.next = remainingNodes
        }
        return dummy?.next
    }
}


extension LinkedList {
    
    public mutating func palindrome() -> Bool {
        
        var slow = head
        var fast = head
        var stack = [Int]()
        
        while fast?.next != nil {
            if let value = slow?.value as? Int {
                stack.append(value)
            }
            
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        if fast != nil {
            slow = slow?.next
        }
        
        while let current = slow, !stack.isEmpty {
            if let value = current.value as? Int {
                if value != stack.removeLast() {
                    return false
                }
            }
            slow = slow?.next
        }
        
        
        return true
    }
}

extension LinkedList {
    
    public mutating func hasLoop() -> Bool {
        
        var fast = head
        var slow = head
        
        while fast != nil, slow != nil {
            
            fast = fast?.next
            if fast === slow {
                return true
            }
            if fast == nil {
                return false
            }
            fast = fast?.next
            if fast === slow {
                return true
            }
            slow = slow?.next            
        }
        
        return false
    }
}
