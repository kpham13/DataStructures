/////////////////////////////////////////////////
// Data Structures - Stacks using Linked Lists //
/////////////////////////////////////////////////

import UIKit

class Node<T> {
    
    var value : T?
    var next : Node?
    
}

class LinkedList<T: Equatable> {
    
    var head : Node<T>?
    
    // Pushing onto stack  by adding to the end of linked list
    func push(value: T) {
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
    
    // Popping off the stack by removing the last node of linked list
    func pop() -> Node<T>? {
        if head != nil {
            var node = head
            var previousNode : Node<T>? = nil
            
            while node?.next != nil {
                previousNode = node
                node = node?.next
            }
            
            // Remove current node by unlinking previous node
            previousNode?.next = nil
            return previousNode
        } else {
            // No nodes in linked list, nothing to pop off
            return nil
        }
    }
    
}

var linkedStack = LinkedList<Int>()
linkedStack.push(3)
linkedStack.push(3999)
linkedStack.push(54)

linkedStack.pop()
