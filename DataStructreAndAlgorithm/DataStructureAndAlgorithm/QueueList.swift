//
//  QueueList.swift
//  DataStructreAndAlgorithm
//
//  Created by Sreejith K R on 10/15/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import Foundation

class QueueList<T>:DataStructure,Q{
    var count: Int = 0;
    var top:T!
    var rear: T!
    var queueList:LinkedList<T> = LinkedList<T>();
    func enqueue(value: T) {
        count += 1
        queueList.addLast(value: value)
    }
    func dequeue() throws -> T {
        try throwInvalidOperationOnEmptyQueue();
        count -= 1

        let retVal = try queueList.removeFirst();
        if(count == 0){
            top = nil
            rear = nil
        }
        return retVal!.value
    }
    
}
