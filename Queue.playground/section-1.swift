/////////////////////////////
// Data Structures - Queue //
/////////////////////////////

// Similar to Stack, but it is first in, first out (FIFO).
// Enqueue to add, dequeue to remove.
// Peek is used to simply observe the value at the front of the queue.

import Foundation

class Queue {
    
    var queueArray = [String]()
    
    // Enqueuing by adding to end of array
    func enqueue(stringToEnqueue: String) {
        queueArray.append(stringToEnqueue)
    }
    
    // Dequeuing by removing at the front of the array
    func dequeue() -> String? {
        if !queueArray.isEmpty {
            var dequeuedString = queueArray.first
            queueArray.removeAtIndex(0)
            return dequeuedString!
        } else {
            return nil
        }
    }
    
    func nextOut() -> String? {
        if !queueArray.isEmpty {
            return queueArray[0]
        } else {
            return nil
        }
    }
}

var myQueue = Queue()
myQueue.enqueue("Cust1")
myQueue.enqueue("Cust2")
myQueue.enqueue("Cust3")
myQueue.dequeue()
myQueue.queueArray
myQueue.queueArray[0]
myQueue.nextOut()
