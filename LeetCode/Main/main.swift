//
//  main.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 16.01.2022.
//

import Foundation

// MARK: - Simple env setup

Env.shouldPrint = false

let solution = Solution()

// solution.solve(level: middle(.))

solution.solve(.hard(.lcp(input: ["flower","flow","flight"], naive: false)))

solution.solve(.middle(.intToRoman(num: 1984)))
solution.solve(.middle(.regExpMatch(s: "abaaaaabbbabbaaa", p: "a.a*b*ab*a*")))

//TimeCounter {
//    solution.solveMiddle(task: .threeSum(nums: ThreeSumTestData.values))
//}

solution.solve(.hard(.fourSum(nums: [1,0,-1,0,-2,2], target: 0)))

solution.solve(.easy(.validParentheses(input: "([{}([{(){}}])])")))

solution.solve(.middle(.generateParenthesis(num: 3, naive: false)))

solution.solve(.hard(.mergeKLists(lists: [[1,4,5],[1,3,4],[2,6]])))
