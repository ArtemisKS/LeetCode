//
//  ThreeSum.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 16.01.2022.
//

import Foundation

struct ThreeSum {
    
    func threeSum(_ nums: [Int], iterative: Bool = true) -> [[Int]] {
        iterative ? threeSumIter(nums) : threeSumRec(nums)
    }
    
    /// Recursive impl
    func threeSumRec(_ nums: [Int]) -> [[Int]] {
        let count = nums.count
        var res: [[Int]] = []
        for (index, _) in nums.enumerated() {
            guard index < count - 1 else { break }
            res += threeSum(for: index, nums: nums)
        }
        return Array(Set(res))
    }
    
    /// Faster iterativeimpl
    func threeSumIter(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [] }
        let sorted = nums.sorted()
        var result = [[Int]]()
        let count = sorted.count
        for i in nums.indices {
            if i != 0, sorted[i] == sorted[i - 1] { continue }
            var j = i + 1
            var k = count - 1
            while j < k {
                let sum = sorted[i] + sorted[j] + sorted[k]
                if sum == 0 {
                    result.append([sorted[i], sorted[j], sorted[k]])
                    j += 1
                    while j < k && sorted[j] == sorted[j-1] {
                        j += 1
                    }
                } else if sum < 0 {
                    j += 1
                } else {
                    k -= 1
                }
            }
        }
        return result
    }
    
    private func threeSum(for index: Int, nums: [Int]) -> [[Int]] {
        var excludedValues: Set<Int> = []
        let sum = -nums[index]
        var nums = Array(nums[index + 1..<nums.count])
        return getThreeSum(&nums, sum, excludedValues: &excludedValues)
    }
    
    private func getThreeSum(_ nums: inout [Int], _ sum: Int, excludedValues: inout Set<Int>) -> [[Int]] {
        let values = twoSum(nums, sum)
        guard !values.isEmpty else { return [] }
        values.forEach { excludedValues.insert($0) }
        nums = nums.filter { !excludedValues.contains($0) }
        return [(values + [-sum]).sorted()] + getThreeSum(&nums, sum, excludedValues: &excludedValues)
    }
    
    private func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int : Int]()
        for num in nums {
            if let complement = dict[num] {
                return [complement, num]
            }
            dict[target - num] = num
        }
        return []
    }
}
