//
//  StackTest.swift
//  DataStructreAndAlgorithmTests
//
//  Created by Sreejith K R on 10/15/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import XCTest
@testable import DataStructureAndAlgorithm

class StackArrayTest: XCTestCase {
    var stack:StackArray<Int>!
    override func setUp() {
        super.setUp()
       stack = StackArray<Int>()
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
    
    func testInilisedSetup(){
        XCTAssert(stack.count == 0)
        XCTAssert(stack.top == nil)
        do{
            var retVal = try stack.pop()
        }catch(DSError.StackCannotPopFromEmptyStackError){
            XCTAssert(true)
        }catch{
            XCTAssert(false)
        }
        XCTAssert(stack.count == 0)
        XCTAssert(stack.isEmpty())
        XCTAssert(stack.peek() == nil)
        
        
    }
    
    func testPop(){
        XCTAssert(stack.count == 0)
        do{
            let _ = try stack.pop()
        }catch(DSError.StackCannotPopFromEmptyStackError){
            XCTAssert(true)
        }catch{
            XCTAssert(false)
        }
        stack.push(value: 1);
        stack.push(value: 2);
        let val1 = try? stack.pop()
        XCTAssert(val1 != nil)
        XCTAssert(val1 == 2)
        XCTAssert(stack.count == 1)
        let val2 = try? stack.pop()
        XCTAssert(val2 == 1)
        XCTAssert(stack.count == 0)
        do{
            let _ = try stack.pop()
        }catch(DSError.StackCannotPopFromEmptyStackError){
            XCTAssert(true)
        }catch{
            XCTAssert(false)
        }
    }
    
    func testPush(){
        
        var count  = stack.count;
        stack.push(value: 1);
        XCTAssert(stack.count == (count+1))
        count  = stack.count
        stack.push(value: 2)
        XCTAssert(stack.count == (count+1))

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
