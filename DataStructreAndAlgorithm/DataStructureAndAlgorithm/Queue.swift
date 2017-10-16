//
//  Queue.swift
//  DataStructreAndAlgorithm
//
//  Created by Sreejith K R on 10/15/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import Foundation

/*
 
 Enqueue
 Dequeue
 Rear
 Front
 
 */
protocol Q{
    associatedtype T
    var top:T!{get set}
    var rear:T!{get set}
    var count:Int{get set}
    func enqueue(value:T);
    func dequeue() throws ->T;
}

extension Q{
    
    func throwInvalidOperationOnEmptyQueue() throws {
        if(count == 0){
            throw DSError.InvalidOperationOnEmptyQueue
        }
    }
    func isEmpty()->Bool{
        return count == 0
    }
}


class Queue<T>: DataStructure,Q {
    var count: Int = 0
    var top:T!
    var rear: T!
    private var queueArray:[T] = []
    func enqueue(value: T) {
        count += 1
        queueArray.append(value)

    }
    func dequeue() throws -> T {
        try throwInvalidOperationOnEmptyQueue()
        count -= 1
        let retVal = queueArray.removeFirst()
        if(count == 0){
            top = nil
            rear = nil
        }
        return retVal
    }
    
}

