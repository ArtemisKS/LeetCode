//
//  Tasks.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 23.04.2022.
//

import Foundation

extension Solution {
    
    func solve(_ level: Level) {
        switch level {
        case let .easy(task):
            solveEasy(task: task)
        case let .middle(task):
            solveMiddle(task: task)
        case let .hard(task):
            solveHard(task: task)
        }
    }
}

// MARK: - Easy

private extension Solution {
    
    func solveEasy(task: Task.Easy) {
        switch task {
        case let .validParentheses(input):
            let solution = ValidParentheses()
            let result = solution.isValid(input)
            print("String '\(input)' \(result ? "has" : "doesn't have") valid parentheses")
        }
    }
}

// MARK: - Middle

private extension Solution {
    
    func solveMiddle(task: Task.Middle) {
        switch task {
        case let .intToRoman(num):
            let intToRoman = IntToRoman()
            let result = intToRoman.intToRoman(num)
            print("\(num) as a roman number: \(result)")
        case let .regExpMatch(s, p):
            let regExpMatch = RegExpMatch()
            let result = regExpMatch.isMatch(s, p)
            print("\(s) \(result ? "is" : "isn't") matched with predicate \(p)")
        case let .threeSum(nums):
            let threeSum = ThreeSum()
            let result = threeSum.threeSum(nums)
            print("Three sums of \(nums.prefix(10)) \(nums.count > 10 ? "... " : ""): \(result)")
        case let .generateParenthesis(num, naive):
            let genPar = GenerateParenthesis()
            let result = naive ? genPar.generateParenthesisNaive(num) : genPar.generateParenthesis(num)
            print("Generated valid parenthesis combinations of \(num) pairs of brackets: \(result)")
        }
    }
}

// MARK: - Hard

private extension Solution {
    
    func solveHard(task: Task.Hard) {
        switch task {
        case let .lcp(input, naive):
            let lcp = LCP()
            let result = lcp.longestCommonPrefix(input, naiveApproach: naive)
            print("LCP of \(input): '\(result)'")
        case let .fourSum(nums, target):
            let fourSum = FourSum()
            let result = fourSum.fourSum(nums, target)
            print("Three sums of \(nums.prefix(10)) \(nums.count > 10 ? "... " : ""): \(result)")
        case let .mergeKLists(lists):
            let mergeKLists = MergeKLists()
            let result = mergeKLists.mergeKLists(mapToListNodes(array: lists))
            let resultString = "Result of mergeKLists for \(lists) is %@"
            if let result = result {
                print(String(format: resultString, ":\n \(result)"))
            } else {
                print(String(format: resultString, "nil"))
            }
        }
    }
    
    func mapToListNodes(array: [[Int]]) -> [ListNode?] {
        array.map { arr in
            var node: ListNode? = ListNode()
            let head = node
            arr.enumerated().forEach { index, val in
                node?.val = val
                guard index != arr.count - 1 else { return }
                node?.next = ListNode()
                node = node?.next
            }
            return head
        }
    }
}
