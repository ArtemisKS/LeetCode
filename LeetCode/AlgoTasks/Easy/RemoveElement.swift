//
//  RemoveElement.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 25.06.2022.
//

import Foundation

struct RemoveElement {
    
    @discardableResult
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var nonValIndex = 0
        for index in nums.indices {
            if nums[index] != val {
                nums.swapAt(nonValIndex, index)
                nonValIndex += 1
            }
        }
        return nonValIndex
    }
}
