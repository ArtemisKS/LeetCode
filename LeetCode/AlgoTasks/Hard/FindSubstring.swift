//
//  FindSubstring.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 02.07.2022.
//

import Foundation

class FindSubstring {
    
    private var wordsDict: [String : Int] = [:]
    private var wordLen = 0
    private var substringLen = 0
    private var wordsCount = 0
    
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        
        guard !words.isEmpty else { return [] }
        
        wordsCount = words.count
        wordLen = words[0].count
        substringLen = wordsCount * wordLen
        
        guard s.count >= substringLen else { return [] }
        
        for word in words {
            let value = wordsDict[word] ?? 0
            wordsDict[word] = value + 1
        }
        
        var result: [Int] = []
        
        for index in 0...s.count - substringLen where isIndexValid(index, s) {
            result.append(index)
        }
        
        return result
    }
    
    private func isIndexValid(_ index: Int, _ s: String) -> Bool {
        var remainingWords = wordsDict
        var wordsUsed = 0
        
        for j in stride(from: index, to: index + substringLen, by: wordLen) {
            let substring = String(s.substring(from: j, upUntil: j + wordLen))
            let value = remainingWords[substring] ?? 0
            if value != 0 {
                remainingWords[substring] = value - 1
                wordsUsed += 1
            } else {
                break
            }
        }
        
        return wordsUsed == wordsCount
    }
}
