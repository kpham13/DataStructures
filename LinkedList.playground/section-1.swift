///////////////////////////////////
// Data Structures - Linked List //
///////////////////////////////////

// Groups of nodes linked together in a sequence.
// Each node stores some piece of data and a pointer to the next value.
// Linear time cost is more expensive than constant time of an array.
// Linked lists are slower than arrays, O(n) > O(1).

import Foundation

class Node<T> {
    
    var value : T?
    var next : Node?
    
}

class LinkedList<T: Equatable> {
    
    var head : Node<T>?
    
    func insert(value: T) {
        // First case (0th) if list is empty
        if head == nil {
            var node = Node<T>()
            node.value = value
            node.next = nil
            head = node
            return
        }
        
        // Walking the list...
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        
        // Adding new node to end of linked list
        var node = Node<T>()
        node.value = value
        node.next = nil
        currentNode?.next = node
    }
    
    func remove(value: T) {
        if head != nil {
            var node = head
            var previousNode : Node<T>? = nil
            
            // Walk the list. Break loop if values match or reach end of linked list.
            while node?.value != value && node?.next != nil {
                previousNode = node
                node = node?.next
            }
            
            // If the current node is the same value...
            if node?.value == value {
                if node?.value == head?.value && node?.next == nil { // HEAD ONLY
                    self.head = nil
                } else if node?.value == head?.value { // HEAD+
                    self.head = node?.next
                } else if node?.next == nil { // TAIL
                    previousNode?.next = nil
                } else {
                    previousNode?.next = node?.next
                }
            }
        }
    }
}

var node2 = Node<Int>()
node2.value = 200

var node1 = Node<Int>()
node1.value = 100
node2.next = node1

var node394 = Node<Int>()
node394.value = 39400
node1.next = node394

println(node2.value!)

var linkedList = LinkedList<Int>()
linkedList.insert(20)
linkedList.insert(10)

linkedList.remove(20)
