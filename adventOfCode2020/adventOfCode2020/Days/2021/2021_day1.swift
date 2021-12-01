//
//  2021_day1.swift
//  adventOfCode
//
//  Created by Elena Skvortsova on 01.12.2021.
//

import Foundation

extension Advent2021 {
    
    static func getDepths(from input: String) -> [Int] {
        return input.components(separatedBy: "\n").compactMap { Int($0) }
    }
    
    static func increasedDepthCount(in array: [Int]) -> Int {
        guard array.count > 0 else {
            return 0
        }
        
        var count = 0
        for i in 1..<array.count {
            if array[i - 1] < array[i] {
                count += 1
            }
        }
        
        return count
    }
    
    // TODO: maybe try to do some queue instead
    static func increasedDepthsBySlidingWindow(in array: [Int], slidingWindowWidth width: Int = 3) -> Int {
        guard array.count > 0 else {
            return 0
        }
        
        var counters = Array(repeating: 0, count: array.count - width + 1)
        let backOffset = -width + 1
        for i in 0..<array.count {
            if 0 < i && i < counters.count {
                counters[i] += array[i]
            }
            for j in backOffset..<0 {
                let counterIndex = i + j
                if 0 < counterIndex && counterIndex < counters.count {
                    counters[counterIndex] += array[i]
                }
            }
        }
        
        let count = increasedDepthCount(in: counters)
        
        return count
    }
}
