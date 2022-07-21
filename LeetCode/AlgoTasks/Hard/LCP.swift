//
//  LCP.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 16.01.2022.
//

import Foundation

struct LCP {
    
    func longestCommonPrefix(_ strs: [String], naiveApproach: Bool = false) -> String {
        naiveApproach ?
        longestCommonPrefixNaive(strs) :
        longestCommonPrefixTrie(strs)
    }
    
    func longestCommonPrefixTrie(_ strs: [String]) -> String {
        guard strs.count > 1 else { return strs.isEmpty ? "" : strs[0] }
        let trie = Trie()
        for i in 1..<strs.count {
            trie.insert(strs[i])
        }
        return trie.searchLongestPrefix(strs[0])
    }
    
    func longestCommonPrefixNaive(_ strs: [String]) -> String {
        guard strs.count > 1 else { return strs.isEmpty ? "" : strs[0] }
        let first = strs[0]
        for i in 0..<first.count {
            let c = first[i]
            for j in 1..<strs.count {
                if i == strs[j].count || strs[j][i] != c {
                    return first.substring(upUntil: i)
                }
            }
        }
        return first
    }
}

private extension TrieNode {
    
    var hasOnlyOneLink: Bool {
        linksNumber == 1
    }
}

private extension Trie {
    
    func searchLongestPrefix(_ prefix: String) -> String {
        var node = root
        var result = ""
        for char in prefix {
            if let curNode = node, let nextNode = curNode.getNode(for: char),
               curNode.hasOnlyOneLink, !curNode.isEnd {
                result.append(char)
                node = nextNode
            } else {
                return result
            }
        }
        return result
    }
}

