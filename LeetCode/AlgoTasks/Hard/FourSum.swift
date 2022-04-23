//
//  FourSum.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 05.02.2022.
//

class FourSum {
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        kSum(nums.sorted(), target, 4)
    }
    
    private func kSum(_ nums: [Int], _ target: Int, _ k: Int) -> [[Int]] {
        var res: [[Int]] = []
        let averageValue = target / k
        guard !nums.isEmpty else { return res }
        guard averageValue >= nums[0] && nums[nums.count - 1] >= averageValue else {
            return res
        }
        guard k != 2 else { return twoSum(nums, target) }
        
        for (i, elem) in nums.enumerated() {
            if i == 0 || nums[i - 1] != elem {
                for subset in kSum(Array(nums[(i + 1)...]), target - elem, k - 1) {
                    res.append([elem] + subset)
                }
            }
        }
        
        return res
    }
    
    private func twoSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var res: [[Int]] = []
        var set: Set<Int> = []
        
        for elem in nums {
            if res.isEmpty || res[res.count - 1][1] != elem {
                if set.contains(target - elem) {
                    res.append([target - elem, elem])
                }
            }
            set.insert(elem)
        }
        
        return res
    }
}
