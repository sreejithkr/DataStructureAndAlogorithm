//
//  Sort.swift
//  DataStructureAndAlgorithm
//
//  Created by Sreejith K R on 12/7/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import Foundation


class Sort {
    /*
     Worst case Complexity is : O(n^2)
     The selection sort compare by iterating over the array items with the sucseeding items in the array and swap based on the sort order for max and min item found in the iteration for  Decending and Assending respectively.
     */
    class func selectionSorting<T>(array:[T],order:SortOrder = .Assending) -> [T] where T:Comparable{
        
        var array:[T] = array
        if(array.count<=0){
            return array
        }
        var currentVal = array[0]

        for iIndex in 0..<array.count{
            currentVal = array[iIndex]
            var val = currentVal;
            var swapIndex = -1

            for jIndex in iIndex+1..<array.count{
                var flag = val < array[jIndex];
                if(order == .Assending ){
                    flag = val > array[jIndex];
                }
                if(flag){
                    val = array[jIndex];
                    swapIndex = jIndex
                }
                
            }
            if(swapIndex != -1){
                array[iIndex] = val;
                array[swapIndex] = currentVal;
            }
            
        }
        
        return array
    }
    
}
