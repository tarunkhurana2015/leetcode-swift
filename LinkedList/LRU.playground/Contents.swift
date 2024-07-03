import UIKit

// https://www.youtube.com/watch?v=Hi5obC_CwIU

/*
 Steps to implement LRU in O(1)
 
 1. Get the Key from the cache
    Move it to the front of the linkedlist
 2. Put the Key, Value into the cache
    If the Key exists , update the value and put it to the front of the linkedlist.
    If the Key does not exist, add the key, value to the front of the linkedlist.
    If the capacity increases remove the tail of the linkedList
 */

class Node<Key, Value> {
    var key: Key
    var value: Value
    var prev: Node?
    var next: Node?
    
    init(key: Key, value: Value) {
        self.key = key
        self.value = value
    }
    
}
extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value)" + "->" + "\(next)"
    }
}

class LRUCache<Key: Hashable, Value> {

    let capacity: Int
    var cache = [Key: Node<Key, Value>]()
    var head: Node<Key, Value>?
    var tail: Node<Key, Value>?
    
    init(capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Key) -> Value? {
        // get the node for the given key
        guard let node = cache[key] else {
            return nil
        }
        removeNode(node) // remove the head
        addToHead(node) // add the noe to the beginning
        return node.value
    }
    
    func put(_ key: Key, _ value: Value) {
        if let node = cache[key] {
            node.value = value
            removeNode(node) // remove the node
            // move the node to the head
            addToHead(node)
        } else {
            let newNode = Node(key: key, value: value)
            cache[key] = newNode
            addToHead(newNode)
            if cache.count > capacity {
                removeTail()
            }
        }
    }
}
extension LRUCache: CustomStringConvertible {
    var description: String {
        return "\(String(describing: head))"
    }
}

extension LRUCache {
    
    func removeTail() {
        guard let node = tail else { return }
        removeNode(node)
        cache[node.key] = nil
    }
    
    func addToHead(_ node: Node<Key, Value>) {
        node.prev = nil
        node.next = head
        head?.prev = node
        head = node
        if tail == nil {
            tail = node
        }
    }
    
    
    func removeNode(_ node: Node<Key, Value>) {
        let prev = node.prev
        let next = node.next
        
        prev?.next = next
        next?.prev = prev
        
        if node === tail {
            tail = prev
        }
        if node === head {
            head = next
        }
    }
}

let lru = LRUCache<Int, Int>(capacity: 5)
lru.put(1, 1)
lru.put(2, 2)
lru.put(3, 3)
lru.put(4, 4)
lru.get(3)
lru.put(1, 5)
lru.get(2)
print(lru)
