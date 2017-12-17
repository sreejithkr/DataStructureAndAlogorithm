//
//  SortTest.swift
//  DataStructureAndAlgorithmTests
//
//  Created by Sreejith K R on 12/7/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import XCTest
@testable import DataStructureAndAlgorithm

class SortTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSelectionSort(){
        var arr = Sort.selectionSorting(array: [11,14,2,4,5,0,6,8])
        XCTAssertTrue(arr[0]==0)
        print(arr)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
