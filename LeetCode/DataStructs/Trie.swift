//
//  Trie.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 16.01.2022.
//

import Foundation

private extension Character {
    
    var unsafeAscii: Int {
        Int(asciiValue!)
    }
}

class Trie {
    
    let root: TrieNode?

    init() {
        root = TrieNode()
    }
    
    func insert(_ word: String) {
        var node = root
        for char in word {
            if node?.containsKey(char) == false {
                let newNode = TrieNode()
                node?.putNode(newNode, for: char)
                node = newNode
            } else {
                node = node?.getNode(for: char)
            }
        }
        node?.setEnd()
    }
    
    func search(_ word: String) -> Bool {
        let node = searchPrefix(word)
        return node != nil && node?.isEnd == true
    }
    
    func startsWith(_ prefix: String) -> Bool {
        searchPrefix(prefix) != nil
    }
    
    private func searchPrefix(_ prefix: String) -> TrieNode? {
        var node = root
        for char in prefix {
            if node?.containsKey(char) == true {
               node = node?.getNode(for: char)
            } else {
                return nil
            }
        }
        return node
    }
}

class TrieNode {
    
    private var links: [TrieNode?] = .init(repeating: nil, count: 26)
    
    private let aAscii = Character("a").unsafeAscii
    
    private(set) var isEnd = false
    private(set) var linksNumber = 0
    
    func containsKey(_ key: Character) -> Bool {
        links[key.unsafeAscii - aAscii] != nil
    }
    
    func getNode(for key: Character) -> TrieNode? {
        links[key.unsafeAscii - aAscii]
    }
    
    func putNode(_ node: TrieNode = TrieNode(), for char: Character) {
        links[char.unsafeAscii - aAscii] = node
        linksNumber += 1
    }
    
    func setEnd() {
        isEnd = true
    }
}
