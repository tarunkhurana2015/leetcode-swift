import UIKit


var queue1 = Queue<Int>()
queue1.enqueue(1)
queue1.enqueue(2)
queue1.enqueue(3)
queue1.enqueue(4)
queue1.description

queue1.dequeue()
queue1.dequeue()
queue1.dequeue()
queue1.dequeue()
queue1.dequeue()
queue1.description


// Queue using 2 Stacks
var queue2 = QueueStack<Int>()
queue2.enqueue(1)
queue2.enqueue(2)
queue2.enqueue(3)
queue2.enqueue(4)
queue2.enqueue(5)
queue2.description

queue2.dequeue()
queue2.description
queue2.enqueue(6)
queue2.description
