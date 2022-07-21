//
//  MergeKLists.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 10.04.2022.
//

import Foundation

struct MergeKLists {
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let lists = lists.compactMap { $0 }
        guard !lists.isEmpty else { return nil }
        var cur: ListNode? = ListNode()
        let res = cur
        var queue = Heap<ListNode>(priorityFunction: <)
        for list in lists {
            queue.enqueue(list)
        }
        while !queue.isEmpty {
            var node = queue.dequeue()
            guard node != nil else { continue }
            cur?.next = ListNode(node!.val)
            cur = cur?.next
            node = node?.next
            if let node = node {
                queue.enqueue(node)
            }
        }
        return res?.next
    }
}

extension ListNode: Comparable {
    
    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val == rhs.val
    }
    
    static func < (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val < rhs.val
    }
}
