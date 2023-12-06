//
//  2023day3.swift
//  adventOfCode2020Tests
//
//  Created by Elena Skvortsova on 06/12/2023.
//

import Foundation

import XCTest
@testable import adventOfCode2020

class AdventOfCode2023Day3: XCTestCase {
    
    func testDay3Test1() {
        let input = ResourceHelper.instance.getInput(from: "2023_day3_test1")
        let inputStrings = Advent2023.getInput(from: input)
        let engineFix = Advent2023.GondolaEngineFix(inputStrings: inputStrings)
        let numbers = engineFix.partNumbers
        let result = numbers.reduce(0, +)
        XCTAssertEqual(result, 4361)
    }
    
    func testDay3Input1() {
        let input = ResourceHelper.instance.getInput(from: "2023_day3_input1")
        let inputStrings = Advent2023.getInput(from: input)
        let engineFix = Advent2023.GondolaEngineFix(inputStrings: inputStrings)
        let numbers = engineFix.partNumbers
        let result = numbers.reduce(0, +)
        XCTAssertEqual(result, 527364)
    }
    
    func testDay3Test2() {
        let input = ResourceHelper.instance.getInput(from: "2023_day3_test1")
        let inputStrings = Advent2023.getInput(from: input)
        let engineFix = Advent2023.GondolaEngineFix(inputStrings: inputStrings)
        let gears = engineFix.gears
        let result: Int = gears.values.reduce(0) { partialResult, numbers in
            print(numbers)
            let sum = numbers.count > 1 ? numbers.reduce(1, *) : 0
            return sum + partialResult
        }
        XCTAssertEqual(result, 467835)
    }
    
    func testDay3Input2() {
        let input = ResourceHelper.instance.getInput(from: "2023_day3_input1")
        let inputStrings = Advent2023.getInput(from: input)
        let engineFix = Advent2023.GondolaEngineFix(inputStrings: inputStrings)
        let gears = engineFix.gears
        let result: Int = gears.values.reduce(0) { partialResult, numbers in
            let sum = numbers.count > 1 ? numbers.reduce(1, *) : 0
            return sum + partialResult
        }
        XCTAssertEqual(result, 79026871)
    }
}
