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
        let result = Advent2023.getSumOfCalibrationValues(from: input)
        XCTAssertEqual(result, 142)
    }

    
    func testDay1Input1() {
    let input = ResourceHelper.instance.getInput(from: "2023_day1_input1")
    let result = Advent2023.getSumOfCalibrationValues(from: input)
    XCTAssertEqual(result, 55488)
}
}
