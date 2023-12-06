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
        let numbers = Advent2023.getPartNumbers(from: inputStrings)
        let result = numbers.reduce(0, +)
        XCTAssertEqual(result, 4361)
    }
    
    func testDay3Input1() {
        let input = ResourceHelper.instance.getInput(from: "2023_day3_input1")
        let inputStrings = Advent2023.getInput(from: input)
        let numbers = Advent2023.getPartNumbers(from: inputStrings)
        let result = numbers.reduce(0, +)
        XCTAssertEqual(result, 527364)
    }
    
    
}
