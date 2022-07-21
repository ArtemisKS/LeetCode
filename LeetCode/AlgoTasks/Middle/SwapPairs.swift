//
//  SwapPairs.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 11.06.2022.
//

import Foundation

struct SwapPairs {
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let head = head, let second = head.next else { return head }
        let first = head
        let rest = swapPairs(second.next)
        first.next = rest
        second.next = first
        return second
    }
}
