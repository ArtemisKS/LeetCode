//
//  GenerateParenthesis.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 19.02.2022.
//

import Foundation

class GenerateParenthesis {
    
    func generateParenthesisNaive(_ n: Int) -> [String] {
        var result: [String] = []
        var current = ""
        backtrack(&result, &current, 0, 0, n)
        return result
    }
    
    private func backtrack(_ result: inout [String],
                           _ current: inout String,
                           _ openCount: Int,
                           _ closeCount: Int,
                           _ max: Int) {
        guard current.count != max * 2 else {
            result.append(current)
            return
        }
        
        func doBacktracking(forOpen: Bool) {
            current.append(forOpen ? "(" : ")")
            backtrack(&result,
                      &current,
                      openCount + forOpen.toInt,
                      closeCount + (!forOpen).toInt,
                      max)
            current.removeLast()
        }
        
        if openCount < max {
            doBacktracking(forOpen: true)
        }
        if closeCount < openCount {
            doBacktracking(forOpen: false)
        }
    }
    
    func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        cprint("n: \(n)")
        if n == 0 {
            result.append("")
        } else {
            for c in 0..<n {
                cprint("for \(c) in 0..<\(n)")
                cprint("<======for left in generateParenthesis(\(c)), n: \(n)======>")
                for left in generateParenthesis(c) {
                    cprint("executed for left '\(left)' in generateParenthesis(\(c)), n: \(n)")
                    cprint("<======for right in generateParenthesis(\(n - 1 - c)), n: \(n)======>")
                    for right in generateParenthesis(n - 1 - c) {
                        cprint("executed for right '\(right)' in generateParenthesis(\(n - 1 - c)), n: \(n)")
                        cprint("(\(left))\(right)")
                        result.append("(\(left))\(right)")
                    }
                }
            }
        }
        return result
    }
}
