import UIKit


let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

print(node1)

//----------------------------------------------------

var linkedList = LinkedList<Int>()
linkedList.push(3)
linkedList.push(2)
linkedList.push(1)

print(linkedList)

//----------------------------------------------------

var linkedList1 = LinkedList<Int>()
linkedList1.append(3)
linkedList1.append(2)
linkedList1.append(1)

print(linkedList1)

//----------------------------------------------------

var linkedList2 = LinkedList<Int>()
linkedList2.push(3)
linkedList2.push(2)
linkedList2.push(1)

print(linkedList2)
let node = linkedList2.node(at: 1)
print(node!)

for _ in 1...2 {
    linkedList2.insert(-1, after: node!)
}
print(linkedList2)

//----------------------------------------------------

var linkedList3 = LinkedList<Int>()
linkedList3.push(3)
linkedList3.push(2)
linkedList3.push(1)

print(linkedList3)

linkedList3.pop()
print(linkedList3)
linkedList3.pop()
print(linkedList3)
linkedList3.pop()
print(linkedList3)
linkedList3.pop()
print(linkedList3)

//----------------------------------------------------

var linkedList4 = LinkedList<Int>()
linkedList4.push(3)
linkedList4.push(2)
linkedList4.push(1)

linkedList4.removeLast()
print(linkedList4)

//----------------------------------------------------

var linkedList5 = LinkedList<Int>()
linkedList5.push(3)
linkedList5.push(2)
linkedList5.push(1)
print(linkedList5)

let node000 = linkedList5.node(at: 1)
linkedList5.remove(after: node000!)
print(linkedList5)
