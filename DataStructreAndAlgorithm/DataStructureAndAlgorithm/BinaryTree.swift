//
//  BinaryTree.swift
//  DataStructreAndAlgorithm
//
//  Created by Sreejith K R on 7/12/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import Foundation


/*
 The operation include 
 
 Inserting an element into tree
 Deleting an element from tree
 Searching for an element
 Traversing the tree
 
 
 Finding height of tree
 Finding size of tree
 Finding the level which has maximum sum
 Finding the least common ancestor for a given pair of nodes
 
 */

class BinaryTreeNode<T>:Node<T>{
    
    var data:T;
    var right:BinaryTreeNode<T>!
    var left:BinaryTreeNode<T>!
    init(data:T) {
        self.data = data;
    }
}

class  BinaryTree<T>:DataStructure {
    
    var root:BinaryTreeNode<T>;
    
    init(root:BinaryTreeNode<T>) {
        self.root = root;
    }
    
}
