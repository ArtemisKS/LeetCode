//
//  RemoveDuplicates.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 11.06.2022.
//

import Foundation

struct RemoveDuplicates {
    
    @discardableResult
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        let placeholder = nums[0] - 1
        var current = placeholder
        for index in nums.indices {
            let elem = nums[index]
            guard current != elem else {
                nums[index] = placeholder
                continue
            }
            current = elem
        }
        nums = nums.filter { $0 != placeholder }
        return nums.count
    }
}
