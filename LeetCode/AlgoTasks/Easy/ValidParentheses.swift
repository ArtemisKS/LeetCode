//
//  ValidParentheses.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 12.02.2022.
//

import Foundation

struct ValidParentheses {
    
    private class Stack<T> {
        private var array: [T] = []
        
        var isEmpty: Bool {
            array.isEmpty
        }
        
        func append(_ element: T) {
            array.append(element)
        }
        
        func pop() -> T? {
            array.popLast()
        }
    }
    
    func isValid(_ s: String) -> Bool {
        let stack = Stack<Character>()
        let openingBrackets: [Character : Int] = ["(" : 0, "[" : 1, "{" : 2]
        let closingBrackets: [Character : Int] = [")" : 0, "]" : -1, "}" : -2]
        for char in s {
            if let closingIndex = closingBrackets[char] {
                guard let openBracket = stack.pop(),
                      let openingIndex = openingBrackets[openBracket],
                      openingIndex + closingIndex == 0 else { return false }
            } else {
                stack.append(char)
            }
        }
        return stack.isEmpty
    }
}
