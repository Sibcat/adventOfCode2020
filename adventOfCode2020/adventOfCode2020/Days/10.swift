//
//  10.swift
//  adventOfCode2020
//
//  Created by Elena Skvortsova on 10.12.2020.
//

import Foundation

class Advent10 {
    private let adapters: Set<Int>
    private let adapterMaxDiff: Int
    private let builtInAdapterDiff: Int
    private let maxAdapter: Int
    
    var possibleWays = [Int: Int]()
    
    init(_ input: String,
         adapterMaxDiff: Int = 3,
         builtInAdapterDiff: Int = 3) {
        var set = Set<Int>(input.split(separator: "\n").compactMap { Int(String($0)) })
        let max = (set.max() ?? 0) + builtInAdapterDiff
        set.insert(max)
        self.adapters = set
        self.adapterMaxDiff = adapterMaxDiff
        self.builtInAdapterDiff = builtInAdapterDiff
        maxAdapter = max
    }
    
    func findDifferences() -> [Int] {
        var diffs = Array(repeating: 0, count: max(adapterMaxDiff, builtInAdapterDiff))
        
        var current = 0
        var index = 0
        while index < adapters.count {
            index += 1
            
            for i in 1...adapterMaxDiff {
                if adapters.contains(current + i) {
                    current = current + i
                    diffs[i - 1] += 1
                    break
                }
            }
        }
        
        return diffs
    }
    
    func multiply1jolt3jolt() -> Int {
        let numbers = findDifferences()
        guard numbers.count > 2 else {
            return 0
        }
        
        return numbers[0] * numbers[2]
    }
    
    func findPossibleWays() -> Int {
        return possibleWays(current: 0) ?? 0
    }
    
    func possibleWays(current: Int) -> Int? {
        if current == maxAdapter {
            return 1
        }
        
        var count = 0
        for i in 1...adapterMaxDiff {
            let next = current + i
            if adapters.contains(next),
                let ways = possibleWays[next] ?? possibleWays(current: next) {
                count += ways
                possibleWays[next] = ways
            }
        }
        
        return count == 0 ? nil : count
    }
}
