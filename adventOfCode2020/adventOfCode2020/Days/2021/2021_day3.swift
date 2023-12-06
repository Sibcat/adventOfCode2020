//
//  2021_day3.swift
//  adventOfCode2020
//
//  Created by Elena Skvortsova on 03.12.2021.
//

import Foundation

extension Advent2021 {

    static func calculatePowerConsumption(from input: String) -> Int {
        let records = input.components(separatedBy: "\n").compactMap { $0.count > 0 ? Array($0) : nil }
        guard records.count > 0 else {
            return 0
        }
        
        let recordLength = records[0].count
        var zeroCounters = Array(repeating: 0, count: recordLength)
        for record in records {
            for i in 0..<recordLength {
                if record[i] == "0" {
                    zeroCounters[i] += 1
                }
            }
        }
        
        let gammaRateStr = zeroCounters.map { zeroCount in
            zeroCount > (records.count / 2) ? "0" : "1"
        }.joined()
        
        let epsilonRateStr = zeroCounters.map { zeroCount in
            zeroCount > (records.count / 2) ? "1" : "0"
        }.joined()
        
        let gammaRate = Int(gammaRateStr, radix: 2) ?? 0
        let epsilonRate = Int(epsilonRateStr, radix: 2) ?? 0
        
        return gammaRate * epsilonRate
    }
    
    static func calculateLifeSupportRating(from input: String) -> Int {
        // NOTE: does not work, I don't remember what I was supposed to do here
        return 0
    }
    
}
