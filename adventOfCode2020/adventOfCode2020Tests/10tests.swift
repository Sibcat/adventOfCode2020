//
//  adventOfCode2020Tests.swift
//  adventOfCode2020Tests
//
//  Created by Elena Skvortsova on 10.12.2020.
//

import XCTest
@testable import adventOfCode2020

class adventOfCode2020Tests: XCTestCase {
    
    // 1

    func testExample1() {
        let input = ResourceHelper.instance.getInput(from: "10.1")
        let advent10 = Advent10(input, adapterMaxDiff: 3, builtInAdapterDiff: 3)
        XCTAssertEqual(advent10.multiply1jolt3jolt(), 220)
    }
    
    func testMyInput1() {
        let input = ResourceHelper.instance.getInput(from: "10")
        let advent10 = Advent10(input, adapterMaxDiff: 3, builtInAdapterDiff: 3)
        XCTAssertEqual(advent10.multiply1jolt3jolt(), 2176)
    }

    // 2
    
    func testExample21() {
        let input = ResourceHelper.instance.getInput(from: "10.1")
        let advent10 = Advent10(input, adapterMaxDiff: 3, builtInAdapterDiff: 3)
        XCTAssertEqual(advent10.findPossibleWays(), 19208)
    }
    
    func testExample22() {
        let input = ResourceHelper.instance.getInput(from: "10.2")
        let advent10 = Advent10(input, adapterMaxDiff: 3, builtInAdapterDiff: 3)
        XCTAssertEqual(advent10.findPossibleWays(), 8)
    }
    
    func testMyInput2() {
        let input = ResourceHelper.instance.getInput(from: "10")
        let advent10 = Advent10(input, adapterMaxDiff: 3, builtInAdapterDiff: 3)
        XCTAssertEqual(advent10.findPossibleWays(), 18512297918464)
    }
}
