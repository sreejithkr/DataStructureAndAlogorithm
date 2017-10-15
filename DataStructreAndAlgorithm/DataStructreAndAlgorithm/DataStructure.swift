//
//  DataStructure.swift
//  DataStructreAndAlgorithm
//
//  Created by Sreejith K R on 10/11/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import Foundation

protocol  DataStructureNode {
    
}
protocol  DataStructure {
    
}

class Node<T>:DataStructureNode{
    
}

enum DSError:Error{
    case OperationOnEmptyListError;
    case OutOfBound
    case StackCannotPopFromEmptyStackError;

}


