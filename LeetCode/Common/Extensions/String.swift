//
//  String.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 16.01.2022.
//

import Foundation

extension String {
    subscript(_ ind: Int) -> Element {
        self[index(startIndex, offsetBy: ind)]
    }
    
    subscript(safe ind: Int) -> Element? {
        hasChar(at: ind) ? self[index(startIndex, offsetBy: ind)] : nil
    }
    
    func hasChar(at index: Int) -> Bool {
        index < count && index > -1
    }
    
    func substring(from startingIndex: Int = 0, upUntil endingIndex: Int? = nil) -> String {
        guard startingIndex < count else { return "" }
        return String(self[index(startIndex, offsetBy: startingIndex)..<(endingIndex != nil ? index(startIndex, offsetBy: endingIndex!) : endIndex)])
    }
    
    func separate(every stride: Int = 1, with separator: Character) -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
}
