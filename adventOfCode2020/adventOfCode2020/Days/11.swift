//
//  11.swift
//  adventOfCode2020
//
//  Created by Elena Skvortsova on 11.12.2020.
//

import Foundation

class Advent11 {
    private let adjactentIndexDiffs = [
        (-1, +1),
        (+0, +1),
        (+1, +1),
        (+1, +0),
        (+1, -1),
        (+0, -1),
        (-1, -1),
        (-1, +0),
    ]
    
    enum Place: Character {
        case empty = "L"
        case occupied = "#"
        case floor = "."
    }
    
    enum NearSeatRule {
        case canSee
        case justNear
    }
    
    let layout: [[Place]]
    let noMoreOccupiedSeats: Int
    let nearSeatRule: NearSeatRule
    
    init(input: String,
         noMoreOccupiedSeats: Int = 4,
         nearSeatRule: NearSeatRule = .justNear) {
        layout = input.split(separator: "\n").map { row in
            row.compactMap { Place(rawValue: $0) }
        }
        self.noMoreOccupiedSeats = noMoreOccupiedSeats
        self.nearSeatRule = nearSeatRule
    }
    
    func makeStableLayout() -> [[Place]] {
        var isAnythingChanged = false
        
        var currentLayout = layout
        repeat {
            var newLayout = [[Place]]()
            isAnythingChanged = false
            
            for i in 0..<currentLayout.count {
                newLayout.append([])
                for j in 0..<currentLayout[i].count {
                    let newPlaceType: Place
                    switch currentLayout[i][j] {
                    case .empty:
                        newPlaceType = adjacentSeatsCount(i: i, j: j, layout: currentLayout) == 0 ?
                            .occupied : .empty
                    case .occupied:
                        newPlaceType = adjacentSeatsCount(i: i, j: j, layout: currentLayout) >= noMoreOccupiedSeats ?
                            .empty : .occupied
                    case .floor:
                        newPlaceType = .floor
                    }
                    if currentLayout[i][j] != newPlaceType {
                        isAnythingChanged = true
                    }
                    newLayout[i].append(newPlaceType)
                }
            }
            
            currentLayout = newLayout
        } while isAnythingChanged
        
        return currentLayout
    }
    
    func countPlaces(state: Place, layout: [[Place]]) -> Int {
        var count = 0
        for row in layout {
            for place in row where place == state {
                count += 1
            }
        }
        
        return count
    }
    
    func makeStableLayoutAndCountPlaces(_ state: Place) -> Int {
        let stableLayout = makeStableLayout()
        return countPlaces(state: state, layout: stableLayout)
    }
}

private extension Advent11 {
    func adjacentSeatsCount(i: Int,
                            j: Int,
                            layout:  [[Place]]) -> Int {
        var count = 0
        for diff in adjactentIndexDiffs {
            var iIndex = i + diff.0
            var jIndex = j + diff.1
            
            if nearSeatRule == .canSee {
                while iIndex >= 0 && iIndex < layout.count &&
                        jIndex >= 0 && jIndex < layout[iIndex].count &&
                        layout[iIndex][jIndex] == .floor {
                    iIndex += diff.0
                    jIndex += diff.1
                }
            }
            
            if iIndex >= 0 && iIndex < layout.count &&
                jIndex >= 0 && jIndex < layout[iIndex].count
                && layout[iIndex][jIndex] == .occupied {
                count += 1
            }
        }
        
        return count
    }
}
