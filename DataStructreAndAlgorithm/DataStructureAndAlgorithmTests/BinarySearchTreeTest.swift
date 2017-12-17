//
//  BinarySearchTreeTest.swift
//  DataStructureAndAlgorithmTests
//
//  Created by Sreejith K R on 11/23/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

@testable import DataStructureAndAlgorithm
import XCTest

class BinarySearchTreeTest: XCTestCase {
    
    var bst:BinarySearchTree<Int>!
    override func setUp() {
        super.setUp()
        bst = BinarySearchTree<Int>()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInsert(){
        bst.insert(data:10)
        bst.insert(data:11)
        bst.insert(data:1)
        bst.insert(data:15)
        bst.insert(data:70)
        bst.insert(data:7)
        bst.insert(data:20)
        bst.insert(data:2)
        
        /*
               1<--10-->11
         
        <--1-->7           20<--11-->15
                2<--7-->                      <--15-->70
         
         */


        //bst.inOrderTraversal(root: bst.root)

        //bst.inOrderTraversal()
      //  bst.inOrderTraversalUsingStack()
        
        bst.postOrderTraversal(root: bst.root)
        bst.postOrderTraversalUsingStack()

        
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
