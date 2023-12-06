//
//  2023_day2.swift
//  adventOfCode2020Tests
//
//  Created by Elena Skvortsova on 06/12/2023.
//

import XCTest
@testable import adventOfCode2020

class AdventOfCode2023Day2: XCTestCase {
    
    func testDay2Test1() {
        let input = ResourceHelper.instance.getInput(from: "2023_day2_test1")
        let inputStrings = Advent2023.getInput(from: input)
        let games = Advent2023.getMinAmountOfCubesInGames(from: inputStrings)
        let config = [
            "red": 12,
            "green": 13,
            "blue": 14
        ]
        let result = Advent2023.getSumOfPossibleGames(for: config, in: games)
        XCTAssertEqual(result, 8)
    }
    
    func testDay2Input1() {
        let input = ResourceHelper.instance.getInput(from: "2023_day2_input1")
        let inputStrings = Advent2023.getInput(from: input)
        let games = Advent2023.getMinAmountOfCubesInGames(from: inputStrings)
        let config = [
            "red": 12,
            "green": 13,
            "blue": 14
        ]
        let result = Advent2023.getSumOfPossibleGames(for: config, in: games)
        XCTAssertEqual(result, 2317)
    }
}
