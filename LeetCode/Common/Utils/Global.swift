//
//  Global.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 10.04.2022.
//

import Foundation

struct Env {
    
    private init() {}
    
    static var shouldPrint = true
}

func cprint(_ items: Any...) {
    guard Env.shouldPrint else { return }
    print(items)
}
