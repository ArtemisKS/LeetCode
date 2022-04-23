//
//  ListNode.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 10.04.2022.
//

import Foundation

class ListNode: CustomStringConvertible {
    var val: Int
    var next: ListNode?
    
    init() {
        val = 0
        next = nil
    }
    
    init(_ val: Int) {
        self.val = val
        next = nil
    }
    
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
    var description: String {
        var res = ""
        var cur: ListNode? = self
        while cur != nil {
            res += res.isEmpty ? "\(cur!.val)" : " -> \(cur!.val)"
            cur = cur?.next
        }
        return res
    }
}
