//
//  RegExpMatch.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 18.01.2022.
//

import Foundation

struct RegExpMatch {
    
    func isMatch(_ s: String, _ p: String) -> Bool {
            guard !p.isEmpty else { return s.isEmpty }
            let firstMatch = !s.isEmpty && "\(s[0]).".contains(p[0])
            if p.count >= 2 && p[1] == "*" {
                return isMatch(s, p.substring(from: 2)) || (firstMatch && isMatch(s.substring(from: 1), p))
            }
            return firstMatch && isMatch(s.substring(from: 1), p.substring(from: 1))
        }
}
