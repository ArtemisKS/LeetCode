//
//  Task.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 23.04.2022.
//

import Foundation

enum Level {
    case easy(Task.Easy)
    case middle(Task.Middle)
    case hard(Task.Hard)
}

enum Task {
    
    // MARK: - Easy
    
    enum Easy {
        case validParentheses(input: String)
        case removeDuplicates(nums: [Int])
        case removeElement(nums: [Int], val: Int)
        case strStr(haystack: String, needle: String)
    }
    
    // MARK: - Middle
    
    enum Middle {
        case intToRoman(num: Int)
        case regExpMatch(s: String, p: String)
        case threeSum(nums: [Int])
        case generateParenthesis(num: Int, naive: Bool)
        case swapPairs(lists: [Int])
        case divide(dividend: Int, divisor: Int)
        case multiplyMatrices(_ m1: [[Any]], _ m2: [[Any]])
    }
    
    // MARK: - Hard
    
    enum Hard {
        case lcp(input: [String], naive: Bool)
        case fourSum(nums: [Int], target: Int)
        case mergeKLists(lists: [[Int]])
        case findSubstring(s: String, words: [String])
    }
}
