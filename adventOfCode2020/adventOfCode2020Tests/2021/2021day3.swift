//
//  2021day3.swift
//  adventOfCode2020Tests
//
//  Created by Elena Skvortsova on 03.12.2021.
//

import XCTest
@testable import adventOfCode2020

class AdventOfCode2021Day3: XCTestCase {

    func testDay3Test1() {
        let input = ResourceHelper.instance.getInput(from: "2021_day3_test")
        let result = Advent2021.calculatePowerConsumption(from: input)
        XCTAssertEqual(result, 198)
    }
    
    func testDay3Input1() {
        let input = ResourceHelper.instance.getInput(from: "2021_day3_input")
        let result = Advent2021.calculatePowerConsumption(from: input)
        XCTAssertEqual(result, 3969000)
    }
    
    func testDay3Test2() {
        let input = ResourceHelper.instance.getInput(from: "2021_day3_test")
        let result = Advent2021.calculateLifeSupportRating(from: input)
        XCTAssertEqual(result, 230)
    }
    
    func testDay3Input2() {

    }
}
