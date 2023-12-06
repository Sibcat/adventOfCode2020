//
//  2023day1.swift
//  adventOfCode2020Tests
//
//  Created by Elena Skvortsova on 06/12/2023.
//

import XCTest
@testable import adventOfCode2020

class AdventOfCode2023Day1: XCTestCase {

    func testDay1Test1() {
        let input = ResourceHelper.instance.getInput(from: "2023_day1_test1")
        let inputStrings = Advent2023.getInput(from: input)
        let result = Advent2023.getSumOfCalibrationValues(from: inputStrings)
        XCTAssertEqual(result, 142)
    }

    
    func testDay1Input1() {
        let input = ResourceHelper.instance.getInput(from: "2023_day1_input1")
        let inputStrings = Advent2023.getInput(from: input)
        let result = Advent2023.getSumOfCalibrationValues(from: inputStrings)
        XCTAssertEqual(result, 55488)
    }
    
    func testDay1Test2() {
        let input = ResourceHelper.instance.getInput(from: "2023_day1_test2")
        let inputStrings = Advent2023.getInput(from: input)
        let result = Advent2023.getSumOfCalibrationValuesWithStringNumbers(from: inputStrings)
        XCTAssertEqual(result, 281)
    }
    
    func testDay1Test3() {
        let input = ResourceHelper.instance.getInput(from: "2023_day1_test3")
        let inputStrings = Advent2023.getInput(from: input)
        let result = Advent2023.getSumOfCalibrationValuesWithStringNumbers(from: inputStrings)
        XCTAssertEqual(result, 54980)
    }
    
    func testDay1Input2() {
        let input = ResourceHelper.instance.getInput(from: "2023_day1_input1")
        let inputStrings = Advent2023.getInput(from: input)
        let result = Advent2023.getSumOfCalibrationValuesWithStringNumbers(from: inputStrings)
        XCTAssertEqual(result, 55614)
    }
}
