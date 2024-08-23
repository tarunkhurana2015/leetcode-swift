/*
 Given the head of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list.

 The first node is considered odd, and the second node is even, and so on.

 Note that the relative order inside both the even and odd groups should remain as it was in the input.

 You must solve the problem in O(1) extra space complexity and O(n) time complexity.

  

 Example 1:


 Input: head = [1,2,3,4,5]
 Output: [1,3,5,2,4]
 Example 2:


 Input: head = [2,1,3,5,6,4,7]
 Output: [2,3,6,7,1,5,4]
 */

class Node {
    let value: Int
    var next: Node?
    
    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
    
}
extension Node: CustomStringConvertible {
    var description: String {
        guard let node = next else {
            return "\(value)"
        }
        return "\(value)->\(node)"
    }
}

struct LinkedList {
    var root: Node?
    
    mutating func addNode(_ value: Int) {
        let newNode = Node(value: value)
        
        guard let _ = root else {
            root = newNode
            return
        }
        
        var tempNode = root
        while tempNode?.next != nil {
            tempNode = tempNode?.next
        }
        tempNode?.next = newNode
    }
}
extension LinkedList {
    func oddEvenList() {
        
        var evenNode = root
        var oddNode = evenNode?.next
        var tempNode = oddNode
        while evenNode?.next != nil {
            evenNode?.next = tempNode?.next
            evenNode = evenNode?.next
            tempNode?.next = evenNode?.next
            tempNode = tempNode?.next
        }
        evenNode?.next = oddNode
    }
}
extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let node = root else {
            return "EmptyList"
        }
        return "\(node)"
    }
}

var list = LinkedList(root: Node(value: 2))
list.addNode(1)
list.addNode(3)
list.addNode(5)
list.addNode(6)
list.addNode(4)
list.addNode(7)
print(list)
list.oddEvenList()
print(list)
