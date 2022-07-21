//
//  MultiplyMatrices.swift
//  LeetCode
//
//  Created by Artem Kupriianets on 21.07.2022.
//

import Foundation

struct MultiplyMatrices {
    
    func multiplyMatrices(_ m1: [[Any]], _ m2: [[Any]]) -> [[Any]] {
        guard !m1.isEmpty && !m2.isEmpty else { return [] }
        // matrices validation
        guard matrixIsCorrect(m1) && matrixIsCorrect(m2),
              m1[0].count == m2.count else {
            return []
        }
        // check if matrices have proper elements
        guard let m1 = mapToFloatMatrix(m1),
              let m2 = mapToFloatMatrix(m2) else {
            return []
        }
        let multStep = m1[0].count
        // res width & height
        let (width, height) = (m2[0].count, m1.count)
        // allocate res array & fill it with 0
        let row: [Float] = .init(repeating: 0, count: width)
        var res: [[Float]] = .init(repeating: row, count: height)
        
        for i in 0..<height { // traversing 1st matrix
            for j in 0..<width { // traversing 2nd matrix
                res[i][j] = 0
                for k in 0..<multStep {
                    res[i][j] += m1[i][k] * m2[k][j]
                }
            }
        }
        return res as [[Any]]
    }
    
    private func mapToFloatMatrix(_ m: [[Any]]) -> [[Float]]? {
        
        func matrixIsProper(_ res: [[Any]], original: [[Any]]) -> Bool {
            matricesAreIdentical(res, original) && matrixIsCorrect(res)
        }
        
        // if downcasts to Int, then a special case
        guard let intM = m as? [[Int]] else {
            let res = m as? [[Float]] ?? []
            return matrixIsProper(res, original: m) ? res : nil
        }
        
        let res = intM.map { row in
            row.compactMap { intVal in
                Float(intVal)
            }
        }
        
        return matrixIsProper(res, original: m) ? res : nil
    }
    
    // Checks that matrices have the same parameters
    // but doesn't compare elements themselves
    private func matricesAreIdentical(_ m1: [[Any]], _ m2: [[Any]]) -> Bool {
        m1.count == m2.count && m1[0].count == m2[0].count
    }
    
    /// Checks if matrix has equal length rows
    private func matrixIsCorrect(_ m: [[Any]]) -> Bool {
        let numberOfElements = m[0].count
        for ind in 1..<m.count - 1 where m[ind].count != numberOfElements {
            return false
        }
        return true
    }
}
