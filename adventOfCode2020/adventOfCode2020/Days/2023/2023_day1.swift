//
//  2023_day1.swift
//  adventOfCode2020
//
//  Created by Elena Skvortsova on 06/12/2023.
//

import Foundation

struct Advent2023 {}

extension Advent2023 {
    
    static var digits: [String: Int] = [
        "one" : 1,
        "two" : 2,
        "three" : 3,
        "four" : 4,
        "five" : 5,
        "six" : 6,
        "seven" : 7,
        "eight" : 8,
        "nine" : 9,
        "enin" : 9,
        "thgie" : 8,
        "neves" : 7,
        "xis" : 6,
        "evif" : 5,
        "ruof" : 4,
        "eerht" : 3,
        "owt" : 2,
        "eno" : 1
    ]
    
    static func getInput(from input: String) -> [String] {
        return input.components(separatedBy: "\n")
    }
    
    static func getCalibrationValues(from inputStrings: [String]) -> [Int] {
        let values = inputStrings.compactMap { (input: String) -> Int? in
            let digits = input.filter { $0.isNumber }
            guard let digit1 = digits.first, let digit2 = digits.last else { return nil }
            let numberStr = "\(digit1)\(digit2)"
            return Int(numberStr)
        }
        return values
    }
    
    static func getSumOfCalibrationValues(from inputStrings: [String]) -> Int {
        let values = Advent2023.getCalibrationValues(from: inputStrings)
        return values.reduce(0, +)
    }
    
    static func getSumOfCalibrationValuesWithStringNumbers(from inputStirngs: [String]) -> Int {
        let regex = /(one|two|three|four|five|six|seven|eight|nine|[0-9])/
        let revertedRegex = /(enin|thgie|neves|xis|evif|ruof|eerht|owt|eno|[0-9])/
        let numbers = inputStirngs.compactMap { string -> Int? in
            let firstMatch = string.firstMatch(of: regex)
            guard let digit1Str = firstMatch else { return nil }
            let d1 = String(digit1Str.0)
            
            let firstMatch2 = String(string.reversed()).firstMatch(of: revertedRegex)
            guard let digit2Str = firstMatch2 else { return nil }
            let d2 = String(digit2Str.0)
            
            guard let digit1 = Int(d1) ?? Advent2023.digits[d1],
                  let digit2 = Int(d2) ?? Advent2023.digits[d2] else { return nil }

            return digit1 * 10 + digit2
        }
        return numbers.reduce(0, +)
    }
}
