//
//  Heap.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 10.04.2022.
//

import Foundation

struct Heap<Element> {
    var elements: [Element]
    let priorityFunction: (Element, Element) -> Bool
    
    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    var count: Int {
        elements.count
    }
    
    func peek() -> Element? {
        elements.first
    }
    
    func isRoot(_ index: Int) -> Bool {
        index == 0
    }
    
    func leftChildIndex(of index: Int) -> Int {
        (2 * index) + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        (2 * index) + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        (index - 1) / 2
    }
    
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex)
        else { return parentIndex }
        return childIndex
    }
    
    func highestPriorityIndex(for parent: Int) -> Int {
        highestPriorityIndex(
            of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)),
            and: rightChildIndex(of: parent))
    }
    
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex
        else { return }
        elements.swapAt(firstIndex, secondIndex)
    }
    
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }
    
    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index),
              isHigherPriority(at: index, than: parent)
        else { return }
        swapElement(at: index, with: parent)
        siftUp(elementAtIndex: parent)
    }
    
    mutating func dequeue() -> Element? {
        guard !isEmpty else { return nil }
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            siftDown(elementAtIndex: 0)
        }
        return element
    }
    
    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        guard index != childIndex else { return }
        swapElement(at: index, with: childIndex)
        siftDown(elementAtIndex: childIndex)
    }
    
    mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }
}

extension Heap: CustomStringConvertible {
    
    var description: String {
        "\(elements)"
    }
}
