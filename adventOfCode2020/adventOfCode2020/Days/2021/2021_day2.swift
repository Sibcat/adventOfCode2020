//
//  2021_day2.swift
//  adventOfCode2020
//
//  Created by Elena Skvortsova on 02.12.2021.
//

import Foundation

extension Advent2021 {
    struct SubmarineAction {
        enum Direction: String {
            case forward
            case down
            case up
        }
        
        let direction: Direction
        let value: Int
    }
    
    static func getRoute(from input: String) -> [SubmarineAction] {
        let actions = input.components(separatedBy: "\n").compactMap { string -> SubmarineAction? in
            let stringAction = string.split(separator: " ")
            guard
                stringAction.count == 2,
                let direction = SubmarineAction.Direction(rawValue: String(stringAction[0])),
                let value = Int(stringAction[1]) else {
                    return nil
                }
            return SubmarineAction(
                direction: direction,
                value: value
            )
        }
        
        return actions
    }
    
    static func getSubmarinePosition(for route: [SubmarineAction]) -> (horizontal: Int, depth: Int) {
        var horizontal = 0
        var depth = 0
        for action in route {
            switch action.direction {
            case .forward:
                horizontal += action.value
            case .down:
                depth += action.value
            case .up:
                depth -= action.value
            }
        }
        
        return (horizontal: horizontal, depth: depth)
    }
    
    static func getAdvancedSubmarinePosition(for route: [SubmarineAction]) -> (horizontal: Int, depth: Int) {
        var horizontal = 0
        var depth = 0
        var aim = 0
        for action in route {
            switch action.direction {
            case .forward:
                horizontal += action.value
                depth += aim * action.value
            case .down:
                aim += action.value
            case .up:
                aim -= action.value
            }
        }
        
        return (horizontal: horizontal, depth: depth)
    }
}
