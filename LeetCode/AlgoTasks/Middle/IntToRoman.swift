//
//  IntToRoman.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 16.01.2022.
//

import Foundation

class IntToRoman {
    
    let valuesDict: [Int : String] =
            [1 : "I", 2 : "II", 3: "III", 5 : "V", 6 : "VI",
             7: "VII", 8: "VIII", 10 : "X", 50 : "L", 100 : "C",
             500 : "D", 1000 : "M", 4 : "IV", 9 : "IX", 40 : "XL",
             90 : "XC", 400 : "CD", 900 : "CM"]

    lazy var orderedValues = valuesDict.map { $0.key }.sorted()

    func intToRoman(_ num: Int) -> String {
        
        func value(from n: Int) -> String {
            var n = n
            var value = 0
            var resStr = ""
            while n != 0 {
                if let symbolStr = valuesDict[n] {
                    resStr += symbolStr
                    break
                }
                value = closestValueLessThan(n)
                n -= value
                guard let symbolStr = valuesDict[value] else { continue }
                resStr += symbolStr
            }
            return resStr
        }
        
        var num = num
        var mod = 10
        var res = 0
        var resStr = ""
        while num != 0 {
            res = num % mod
            let symbolStr = valuesDict[res] ?? value(from: res)
            resStr.insert(contentsOf: symbolStr, at: resStr.startIndex)
            mod *= 10
            num -= res
        }
        return resStr
    }
    
    private func closestValueLessThan(_ n: Int) -> Int {
        let count = orderedValues.count
        var index = (count - 1) / 2
        var prevIndex = 0
        var temp = 0
        while index > -1 && index < count &&
                !(orderedValues[index] < n && (index == count - 1 || orderedValues[index + 1] > n)) {
            temp = index
            let shouldIncreaseIndex = orderedValues[index] < n
            if shouldIncreaseIndex {
                index += abs(prevIndex - index) / 2
            } else {
                index -= abs(prevIndex - index) / 2
            }
            if index == temp {
                index = shouldIncreaseIndex ? index + 1 : index - 1
            }
            prevIndex = temp
        }
        return index < count ? orderedValues[index] : orderedValues.last!
    }

}
