//
//  Stack.swift
//  DataStructreAndAlgorithm
//
//  Created by Sreejith K R on 10/11/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import Foundation

/*
 
 */



protocol  Stack {
    associatedtype T;
    var count:Int {get set}
    var top:T!{get set}
    func push(value:T)
    func pop() throws ->T

}

extension Stack{
    func throwCannotPopError() throws{
        if(count == 0){
            throw DSError.StackCannotPopFromEmptyStackError;
        }
    }
    
    func isEmpty()->Bool{
        return count == 0
    }
    
    func peek() ->T?{
        return top
    }
}

/*
 The StackArray is the generic implementation for the stack. The backing data structure used witing to implement the stack is the
 foundation array provided by swift foundation framework. Generally all the stack operation will take constant O(1) time complexity.
 However the array implementation will take in case of Objective C - Swift bridging for pop/append operation O(n).
 //Courtesy Answer from stackoverflow https://stackoverflow.com/questions/46748339/why-poplast-method-in-swift-array-has-complexity-on-if-the-array-is-bridged
 Array has copy-on-write semantics, i.e. when an array is mutated, it has to check whether it is the exclusive owner of its storage buffer. If there are other arrays sharing the buffer, the array has to make a copy before it can mutate the buffer.
 If an array is bridged from NSMutableArray (and possibly NSArray), it can't reliably determine if other owners exist on the Objective-C side, so it always has to make a copy. In other words, a bridged array is converted into a native Swift array on the first mutation, and that's an O(n) operation.
 */
class StackArray<T>: DataStructure,Stack {
    var count: Int = 0;
    var top: T!
    
    //total complexity will be O(n)
    func pop() throws -> T {
        try throwCannotPopError();
        count -= 1
        //O(*n*) is the complexity of the remove last operation
        return valueHolderArray.popLast()!
        
    }
    
    
    private var valueHolderArray = [T]();
    
    func push(value:T){
        top = value
        valueHolderArray.append(value)
        count += 1
    }
    
    
}

