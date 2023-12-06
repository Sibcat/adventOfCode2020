//
//  2023_day1.swift
//  adventOfCode2020
//
//  Created by Elena Skvortsova on 06/12/2023.
//

import Foundation

struct Advent2023 {}

extension Advent2023 {
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
    
    static func getSumOfCalibrationValues(from input: String) -> Int {
        let inputStrings = Advent2023.getInput(from: input)
        let values = Advent2023.getCalibrationValues(from: inputStrings)
        return values.reduce(0, +)
    }
}
