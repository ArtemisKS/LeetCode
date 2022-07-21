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
            let result = ValidParentheses().isValid(input)
            print("String '\(input)' \(result ? "has" : "doesn't have") valid parentheses")
        case let .removeDuplicates(originalNums):
            var nums = originalNums
            RemoveDuplicates().removeDuplicates(&nums)
            print("Remove duplicates for \(originalNums):\n\(nums)")
        case let .removeElement(originalNums, val):
            var nums = originalNums
            let k = RemoveElement().removeElement(&nums, val)
            print("Remove element \(val) for \(originalNums):\n\(nums); k: \(k)")
        case let .strStr(haystack, needle):
            let index = StrStr().strStr(haystack, needle)
            print("StrStr index of \(needle) in \(haystack) is: \(index)")
        }
    }
}

// MARK: - Middle

private extension Solution {
    
    func solveMiddle(task: Task.Middle) {
        switch task {
        case let .intToRoman(num):
            let result = IntToRoman().intToRoman(num)
            print("\(num) as a roman number: \(result)")
        case let .regExpMatch(s, p):
            let result = RegExpMatch().isMatch(s, p)
            print("\(s) \(result ? "is" : "isn't") matched with predicate \(p)")
        case let .threeSum(nums):
            let result = ThreeSum().threeSum(nums)
            print("Three sums of \(nums.prefix(10)) \(nums.count > 10 ? "... " : ""): \(result)")
        case let .generateParenthesis(num, naive):
            let genPar = GenerateParenthesis()
            let result = naive ? genPar.generateParenthesisNaive(num) : genPar.generateParenthesis(num)
            print("Generated valid parenthesis combinations of \(num) pairs of brackets: \(result)")
        case let .swapPairs(lists):
            let result = SwapPairs().swapPairs(mapToListNode(array: lists))
            let resultString = "Result of swapPairs for \(lists) is %@"
            if let result = result {
                print(String(format: resultString, ":\n \(result)"))
            } else {
                print(String(format: resultString, "nil"))
            }
        case let .divide(dividend, divisor):
            let result = Divide().divide(dividend, divisor)
            print("Quotient of division of \(dividend) by \(divisor) is \(result)")
        case let .multiplyMatrices(m1, m2):
            let result = MultiplyMatrices().multiplyMatrices(m1, m2)
            print("Result of multiplication of matrices m1\n\(String(describing: m1))\nand\n\(String(describing: m2)) is \(String(describing: result))")
        }
    }
}

protocol ArrayMatricesRepresentable: CustomStringConvertible {}

extension Array: ArrayMatricesRepresentable where Self.Element == [Any] {}

extension String {
    init<Array>(describing instance: Array) where Array: ArrayMatricesRepresentable & Sequence {
        let values = instance.map { "\($0)" }.joined(separator: ",\n")
        self.init("[\n\(values)\n]")
    }
}

// MARK: - Hard

private extension Solution {
    
    func solveHard(task: Task.Hard) {
        switch task {
        case let .lcp(input, naive):
            let result = LCP().longestCommonPrefix(input, naiveApproach: naive)
            print("LCP of \(input): '\(result)'")
        case let .fourSum(nums, target):
            let result = FourSum().fourSum(nums, target)
            print("Three sums of \(nums.prefix(10)) \(nums.count > 10 ? "... " : ""): \(result)")
        case let .mergeKLists(lists):
            let result = MergeKLists().mergeKLists(mapToListNodes(array: lists))
            let resultString = "Result of mergeKLists for \(lists) is %@"
            if let result = result {
                print(String(format: resultString, ":\n \(result)"))
            } else {
                print(String(format: resultString, "nil"))
            }
        case let .findSubstring(s, words):
            let result = FindSubstring().findSubstring(s, words)
            print("Resulting indices of finding substring for words \(words) in \(s): \(result)")
        }
    }
    
    func mapToListNodes(array: [[Int]]) -> [ListNode?] {
        array.map { mapToListNode(array: $0) }
    }
    
    func mapToListNode(array: [Int]) -> ListNode? {
        var node: ListNode? = ListNode()
        let head = node
        array.enumerated().forEach { index, val in
            node?.val = val
            guard index != array.count - 1 else { return }
            node?.next = ListNode()
            node = node?.next
        }
        return head
    }
}
