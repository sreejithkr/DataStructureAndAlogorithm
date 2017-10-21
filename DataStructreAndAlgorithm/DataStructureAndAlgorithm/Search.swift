//
//  Search.swift
//  DataStructureAndAlgorithm
//
//  Created by Sreejith K R on 10/18/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import Foundation


enum SortOrder{
    case Assending,Decending
}
class Search<T> where T:Comparable{
    
    //using recursion
    class func binarySearch(searchArray:[T],item:T,order:SortOrder = .Assending)->Bool{
        let length = searchArray.count;
        
        if(length == 0){
            return false;
        }
        if(length == 1){
            return searchArray[0] == item
        }
        let midIndex = length/2
        
        if(searchArray[midIndex] > item){
            if(order == .Assending){
                return Search.binarySearch(searchArray: Array(searchArray[0..<midIndex]), item: item, order:order)
            }else{
                return Search.binarySearch(searchArray: Array(searchArray[midIndex..<length]), item: item, order:order)

            }
        }else{
            if(order == .Assending){
                return Search.binarySearch(searchArray: Array(searchArray[midIndex..<length]), item: item, order:order)

            }else{
                return Search.binarySearch(searchArray: Array(searchArray[0..<midIndex]), item: item, order:order)
            }
        }
        
        return true;
    }
}
