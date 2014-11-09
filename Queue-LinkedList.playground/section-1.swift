// Data Structures - Queue using Linked Lists
// Queues are First In, First Out (FIFO)

import UIKit

class Node<T> {
    
    var value : T?
    var next : Node?

}

class LinkedList<T: Equatable> {
    
    var head : Node<T>?
    
    // Enqueuing by adding to the end of linked list
    func enqueue(value: T) {
        // First case if list is empty
        if head == nil {
            var node = Node<T>()
            node.value = value
            node.next = nil
            head = node
            return
        }
        
        // Walking the list
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        
        // Adding new node at end of linked list
        var node = Node<T>()
        node.value = value
        node.next = nil
        currentNode?.next = node
    }
    
    // Dequeuing by removing head node from linked list
    func dequeue() -> Node<T>? {
        if head != nil {
            var node = head
            head = node?.next
            return Node<T>()
        } else {
            return nil
        }
    }
    
}

var linkedQueue = LinkedList<Int>()
linkedQueue.enqueue(3)
linkedQueue.enqueue(3999)

linkedQueue.dequeue()