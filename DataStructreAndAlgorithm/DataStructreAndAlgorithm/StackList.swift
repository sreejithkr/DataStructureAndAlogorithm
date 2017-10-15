//
//  StackList.swift
//  DataStructreAndAlgorithm
//
//  Created by Sreejith K R on 10/14/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import Foundation



class StackList<T>: DataStructure,Stack {
    var count: Int = 0;
    var top: T!
    private var valueHolderList = LinkedList<T>();
    
    func push(value:T){
        count += 1
        valueHolderList.addLast(value: value);
        top = value;
    }
    func pop() throws ->T{
        try throwCannotPopError();
        count -= 1
        let retVal = try! valueHolderList.removeLast();
        return retVal!.value;
        
    }
  
}
