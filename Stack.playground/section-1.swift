//////////////////////////////
// Data Structures - Stacks //
//////////////////////////////

// "The stack data structure is one of the most important data structures in computer science."
// Last in, first out (LIFO).
// The last thing we added to the stack (pushed) is the first thing that gets taken off (popped).

import UIKit

class Stack {
    
    var stackArray = [String]()
    
    // Pushing onto stack by adding to the end of array
    func push(stringToPush: String) {
        stackArray.append(stringToPush)
    }
    
    // Popping off the stack by removing the last
    func pop() -> String? {
        if !self.stackArray.isEmpty {
            var stringToReturn = stackArray.last
            stackArray.removeLast()
            return stringToReturn!
        } else {
            return nil
        }
    }
    
    // Peek at next one to get popped off
    func peek() -> String? {
        if let string = stackArray.last {
            return string
        } else {
            return nil
        }
    }
    
}

var myStack = Stack()
myStack.push("Push")
myStack.push("Pop")
myStack.push("n")
myStack.push("Lock")
myStack.pop()
println(myStack.stackArray)
myStack.peek()