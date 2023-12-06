//
//  2023_day4.swift
//  adventOfCode2020
//
//  Created by Elena Skvortsova on 06/12/2023.
//

import Foundation

extension Advent2023 {
        class Card {
            static var winAmounts: [Int: Decimal] = [
                1: 1,
                2: 2,
                3: 4,
                4: 8,
                5: 16,
                6: 32,
                7: 64,
                8: 128
            ]
            
            let winningNumbers: Set<Int>
            let actualNumbers: [Int]
            
            init(input: String) {
                print(input)
                let components = input.split(separator: ":")
                print(components)
                let numberLines = components[1].split(separator: "|")
                self.winningNumbers = Set(numberLines[0].split(separator: " ").compactMap({ Int($0) }))
                self.actualNumbers = numberLines[1].split(separator: " ").compactMap({ Int($0) })
            }
            
            func getWinAmount() -> Decimal {
                var matches = 0
                for actualNumber in actualNumbers where winningNumbers.contains(actualNumber) {
                    matches += 1
                }
                
                guard matches > 0 else { return 0 }
                
                if let winAmount = Card.winAmounts[matches] {
                    return winAmount
                } else {
                    let winAmount = pow(2, matches - 1)
                    Card.winAmounts[matches] = winAmount
                    return winAmount
                }
            }
        }
}
