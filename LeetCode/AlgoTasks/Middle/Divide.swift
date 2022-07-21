//
//  Divide.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 26.06.2022.
//

import Foundation

struct Divide {
    
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let isNegative = (dividend < 0) != (divisor < 0)
        var dividend = abs(dividend)
        let divisor = abs(divisor)
        var sum = divisor
        var result = 0
        while sum <= dividend {
            var quot = 1
            while sum << 1 <= dividend {
                sum <<= 1
                quot <<= 1
            }
            dividend -= sum
            sum = divisor
            result += quot
        }
        return min(Int(Int32.max), max(isNegative ? -result : result, Int(Int32.min)))
    }
    
    private func slowDivide(_ dividend: Int, _ divisor: Int) -> Int {
        var mutDividend = mod(dividend)
        let modDivisor = mod(divisor)
        
        var result = 0
        
        guard modDivisor != 1 else {
            result = divisor > 0 ? dividend : -dividend
            return handleOverflowIfNeeded(result)
        }
        
        while mutDividend >= modDivisor {
            mutDividend -= modDivisor
            result += 1
        }
        
        func mod(_ number: Int) -> Int {
            number > 0 ? number : -number
        }
        
        func areOfSameSign(_ val1: Int, _ val2: Int) -> Bool {
            (val1 < 0 && val2 < 0) || (val1 > 0 && val2 > 0)
        }
        
        func handleOverflowIfNeeded(_ result: Int) -> Int {
            if result > Int32.max {
                return Int(Int32.max)
            } else if result < Int32.min {
                return Int(Int32.min)
            }
            return result
        }
        
        result = areOfSameSign(dividend, divisor) ? result : -result
        
        return handleOverflowIfNeeded(result)
    }
}
