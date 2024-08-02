class SinglyLinkedListNode {
    var data: Int
    var next: SinglyLinkedListNode?
    
    init(data: Int, next: SinglyLinkedListNode? = nil) {
        self.data = data
        self.next = next
    }
}
extension SinglyLinkedListNode: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(data)"
        }
        
        return "\(data) -> \(next)"
    }
}


func insertNodeAtPosition(llist: SinglyLinkedListNode?, data: Int, position: Int) -> SinglyLinkedListNode? {
    
    var linkedList = llist
    var newPosition = position - 1
    while newPosition > 1 {
        newPosition -= 1
        linkedList = linkedList?.next
    }
    if position - 1 == 0 {
        let newLinkedList = SinglyLinkedListNode(data: data, next: llist)
        return newLinkedList
    } else {
        let newLinkedList = SinglyLinkedListNode(data: data, next: linkedList?.next)
        linkedList?.next = newLinkedList
    }

    return llist
}

var node = SinglyLinkedListNode(data: 1)
var node1 = insertNodeAtPosition(llist: node, data: 2, position: 2)
var node2 = insertNodeAtPosition(llist: node, data: 3, position: 3)
var node3 = insertNodeAtPosition(llist: node, data: 4, position: 2)
var node4 = insertNodeAtPosition(llist: node, data: 5, position: 1)
var node5 = insertNodeAtPosition(llist: node4, data: 6, position: 1)
var node6 = insertNodeAtPosition(llist: node5, data: 7, position: 7)
node6?.description
