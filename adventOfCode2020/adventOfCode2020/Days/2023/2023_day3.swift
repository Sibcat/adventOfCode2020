//
//  2023_day3.swift
//  adventOfCode2020
//
//  Created by Elena Skvortsova on 06/12/2023.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        get {
            0 <= index && index < count ? self[index] : nil
        }
    }
}

extension Character {
    func isNotNumberOrDot() -> Bool {
        !isNumber && self != "."
    }
    
    func isMultiplier() -> Bool {
        self == "*"
    }
}

extension Advent2023 {
    
    class GondolaEngineFix {
        struct Coordinate: Hashable {
            let x: Int
            let y: Int
        }
        
        private(set) var gears: [Coordinate: [Int]] = [:]
        let partNumbers: [Int]
        
        init(inputStrings: [String]) {
            var numbers = [Int] ()
            let stringArrays = inputStrings.map { Array($0) }
            for (i, string) in stringArrays.enumerated() {
                var number = [Character]()
                var isPartNumber = false
                var gearCoordinates = [Coordinate]()
                for (k, character) in string.enumerated() {
                    if character.isNumber {
                        number.append(character)
                        if !isPartNumber,
                           stringArrays[safe: i - 1]?[safe: k - 1]?.isNotNumberOrDot() ?? false ||
                            stringArrays[safe: i - 1]?[safe: k]?.isNotNumberOrDot() ?? false ||
                            stringArrays[safe: i - 1]?[safe: k + 1]?.isNotNumberOrDot() ?? false ||
                            stringArrays[safe: i]?[safe: k - 1]?.isNotNumberOrDot() ?? false ||
                            stringArrays[safe: i]?[safe: k + 1]?.isNotNumberOrDot() ?? false ||
                            stringArrays[safe: i + 1]?[safe: k - 1]?.isNotNumberOrDot() ?? false ||
                            stringArrays[safe: i + 1]?[safe: k]?.isNotNumberOrDot() ?? false ||
                            stringArrays[safe: i + 1]?[safe: k + 1]?.isNotNumberOrDot() ?? false {
                            isPartNumber = true
                            
                            if stringArrays[safe: i - 1]?[safe: k - 1]?.isMultiplier() ?? false {
                                gearCoordinates.append(Coordinate(x: i - 1, y: k - 1))
                            }
                            if stringArrays[safe: i - 1]?[safe: k]?.isMultiplier() ?? false {
                                gearCoordinates.append(Coordinate(x: i - 1, y: k))
                            }
                            if stringArrays[safe: i - 1]?[safe: k + 1]?.isMultiplier() ?? false {
                                gearCoordinates.append(Coordinate(x: i - 1, y: k + 1))
                            }
                            if stringArrays[safe: i]?[safe: k - 1]?.isMultiplier() ?? false {
                                gearCoordinates.append(Coordinate(x: i, y: k - 1))
                            }
                            if stringArrays[safe: i]?[safe: k + 1]?.isMultiplier() ?? false {
                                gearCoordinates.append(Coordinate(x: i, y: k + 1))
                            }
                            if stringArrays[safe: i + 1]?[safe: k - 1]?.isMultiplier() ?? false {
                                gearCoordinates.append(Coordinate(x: i + 1, y: k - 1))
                            }
                            if stringArrays[safe: i + 1]?[safe: k]?.isMultiplier() ?? false {
                                gearCoordinates.append(Coordinate(x: i + 1, y: k))
                            }
                            if stringArrays[safe: i + 1]?[safe: k + 1]?.isMultiplier() ?? false {
                                gearCoordinates.append(Coordinate(x: i + 1, y: k + 1))
                            }
                        }
                        // debug print
                        //                    print("""
                        //\(stringArrays[safe: i - 1]?[safe: k - 1] ?? "⬛️")\(stringArrays[safe: i - 1]?[safe: k] ?? "⬛️")\(stringArrays[safe: i - 1]?[safe: k + 1] ?? "⬛️")
                        //\(stringArrays[safe: i]?[safe: k - 1] ?? "⬛️")\(stringArrays[safe: i]?[safe: k] ?? "⬛️")\(stringArrays[safe: i]?[safe: k + 1] ?? "⬛️")
                        //\(stringArrays[safe: i + 1]?[safe: k - 1] ?? "⬛️")\(stringArrays[safe: i + 1]?[safe: k] ?? "⬛️")\(stringArrays[safe: i + 1]?[safe: k + 1] ?? "⬛️")
                        //""")
                    } else {
                        if !number.isEmpty {
                            let numberInt = Int(String(number)) ?? 0
                            if isPartNumber {
                                numbers.append(numberInt)
                                for coordinate in gearCoordinates {
                                    gears[coordinate, default: []].append(numberInt)
                                }
                            }
                            // debug print
                            // print("\(isPartNumber ? "IS PART NUMBER:" : "NOT PART NUMBER") \(numberInt)")
                        }
                        number = []
                        isPartNumber = false
                        gearCoordinates = []
                    }
                }
                if !number.isEmpty {
                    let numberInt = Int(String(number)) ?? 0
                    if isPartNumber {
                        numbers.append(numberInt)
                        for coordinate in gearCoordinates {
                            gears[coordinate, default: []].append(numberInt)
                        }
                    }
                    // debug print
                    // print("\(isPartNumber ? "IS PART NUMBER:" : "NOT PART NUMBER") \(numberInt)")
                }
                number = []
                isPartNumber = false
                gearCoordinates = []
            }
            self.partNumbers = numbers
        }
    }
}
