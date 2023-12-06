//
//  2023day4.swift
//  adventOfCode2020Tests
//
//  Created by Elena Skvortsova on 06/12/2023.
//

import XCTest
@testable import adventOfCode2020

class AdventOfCode2023Day4: XCTestCase {
    
    func testDay3Test1() {
        let input = ResourceHelper.instance.getInput(from: "2023_day4_test")
        let inputStrings = Advent2023.getInput(from: input).filter { !$0.isEmpty }
        let cards = inputStrings.map { Advent2023.Card(input: $0) }
        let result = cards.reduce(0) { partialResult, card in
            partialResult + card.getWinAmount()
        }
        XCTAssertEqual(result, 13)
    }
    
    func testDay3Input1() {
        let input = ResourceHelper.instance.getInput(from: "2023_day4_input")
        let inputStrings = Advent2023.getInput(from: input).filter { !$0.isEmpty }
        let cards = inputStrings.map { Advent2023.Card(input: $0) }
        let result = cards.reduce(0) { partialResult, card in
            partialResult + card.getWinAmount()
        }
        XCTAssertEqual(result, 21821)
    }
}
