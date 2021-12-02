//
//  2021day2.swift
//  adventOfCode2020Tests
//
//  Created by Elena Skvortsova on 02.12.2021.
//

import XCTest
@testable import adventOfCode2020

class AdventOfCode2021Day2: XCTestCase {

    func testDay2Test1() {
        let input = ResourceHelper.instance.getInput(from: "2021_day2_test")
        let route = Advent2021.getRoute(from: input)
        let (horizontalPosition, depth) = Advent2021.getSubmarinePosition(for: route)
        let result = horizontalPosition * depth
        XCTAssertEqual(result, 150)
    }
    
    func testDay2Input1() {
        let input = ResourceHelper.instance.getInput(from: "2021_day2_input")
        let route = Advent2021.getRoute(from: input)
        let (horizontalPosition, depth) = Advent2021.getSubmarinePosition(for: route)
        let result = horizontalPosition * depth
        XCTAssertEqual(result, 1813801)
    }
    
    func testDay2Test2() {
        let input = ResourceHelper.instance.getInput(from: "2021_day2_test")
        let route = Advent2021.getRoute(from: input)
        let (horizontalPosition, depth) = Advent2021.getAdvancedSubmarinePosition(for: route)
        let result = horizontalPosition * depth
        XCTAssertEqual(result, 900)
    }
    
    func testDay2Input2() {
        let input = ResourceHelper.instance.getInput(from: "2021_day2_input")
        let route = Advent2021.getRoute(from: input)
        let (horizontalPosition, depth) = Advent2021.getAdvancedSubmarinePosition(for: route)
        let result = horizontalPosition * depth
        XCTAssertEqual(result, 1960569556)
    }
}
