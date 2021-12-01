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
}
