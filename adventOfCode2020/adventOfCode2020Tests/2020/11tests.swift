//
//  11tests.swift
//  adventOfCode2020Tests
//
//  Created by Elena Skvortsova on 11.12.2020.
//

import XCTest

class _1tests: XCTestCase {

    func testExample1() {
        let input = ResourceHelper.instance.getInput(from: "11.1")
        let advent = Advent11(input: input)
        
        XCTAssertEqual(advent.makeStableLayoutAndCountPlaces(.occupied), 37)
    }
    
    func testMyInput1() {
        let input = ResourceHelper.instance.getInput(from: "11")
        let advent = Advent11(input: input)
        
        XCTAssertEqual(advent.makeStableLayoutAndCountPlaces(.occupied), 2108)
    }
    
    func testExample2() {
        let input = ResourceHelper.instance.getInput(from: "11.1")
        let advent = Advent11(input: input,
                              noMoreOccupiedSeats: 5,
                              nearSeatRule: .canSee)
        
        XCTAssertEqual(advent.makeStableLayoutAndCountPlaces(.occupied), 26)
    }
    
    func testMyInput2() {
        let input = ResourceHelper.instance.getInput(from: "11")
        let advent = Advent11(input: input,
                              noMoreOccupiedSeats: 5,
                              nearSeatRule: .canSee)
        
        XCTAssertEqual(advent.makeStableLayoutAndCountPlaces(.occupied), 1897)
    }

}
