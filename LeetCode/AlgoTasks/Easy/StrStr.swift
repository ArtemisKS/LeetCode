//
//  StrStr.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 25.06.2022.
//

import Foundation

struct StrStr {
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else { return 0 }
        var needleIdx = 0
        for index in haystack.indices {
            if haystack[index] == needle[needleIdx],
               let result = compareStrings(index: index) {
                return result
            }
            needleIdx = 0
        }
        
        func compareStrings(index: String.Index) -> Int? {
            var index = haystack.distance(from: haystack.startIndex, to: index)
            while haystack[index] == needle[needleIdx] {
                if needleIdx == needle.count - 1 {
                    return index - needleIdx
                } else if index == haystack.count - 1 {
                    return -1
                }
                needleIdx += 1
                index += 1
            }
            return nil
        }
        
        return -1
    }
}
