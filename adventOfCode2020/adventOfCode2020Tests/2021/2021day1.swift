//
//  2021_day1.swift
//  adventOfCodeTests
//
//  Created by Elena Skvortsova on 01.12.2021.
//

import XCTest
@testable import adventOfCode2020

class AdventOfCode2021Day1: XCTestCase {

    func testDay1Test1() {
        let input = ResourceHelper.instance.getInput(from: "2021_day1_test1")
        let depths = Advent2021.getDepths(from: input)
        let result = Advent2021.increasedDepthCount(in: depths)
        XCTAssertEqual(result, 7)
    }

    
    func testDay1Input1() {
        let input = ResourceHelper.instance.getInput(from: "2021_day1_input1")
        let depths = Advent2021.getDepths(from: input)
        let result = Advent2021.increasedDepthCount(in: depths)
        XCTAssertEqual(result, 1655)
    }
}
