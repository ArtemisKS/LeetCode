//
//  TimeCounter.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 19.01.2022.
//

import Foundation

class TimeCounter {
    
    @discardableResult
    init(completion: () -> Void) {
        let time = Date()
        completion()
        print("Time used (sec): \(Date().timeIntervalSince1970 - time.timeIntervalSince1970)")
    }
}
