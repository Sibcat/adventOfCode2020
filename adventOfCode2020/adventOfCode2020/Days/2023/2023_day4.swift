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
                let components = input.split(separator: ":")
                let numberLines = components[1].split(separator: "|")
                self.winningNumbers = Set(numberLines[0].split(separator: " ").compactMap({ Int($0) }))
                self.actualNumbers = numberLines[1].split(separator: " ").compactMap({ Int($0) })
            }
            
            static func getWinAmount(matches: Int) -> Decimal {
                guard matches > 0 else { return 0 }
                
                if let winAmount = Card.winAmounts[matches] {
                    return winAmount
                } else {
                    let winAmount = pow(2, matches - 1)
                    Card.winAmounts[matches] = winAmount
                    return winAmount
                }
            }
            
            func getMatches() -> Int {
                var matches = 0
                for actualNumber in actualNumbers where winningNumbers.contains(actualNumber) {
                    matches += 1
                }
                return matches
            }
        }
    
    class CardCounter {
        let cards: [Card]
        
        init(cards: [Card]) {
            self.cards = cards
        }
        
        func getWinnedCardsCount() -> Int {
            var cardsToCheck = Array(cards.indices)
            var cardToCheckIndex = 0
            var winnedCards = 0
            while cardToCheckIndex < cardsToCheck.count  {
                let cardIndex = cardsToCheck[cardToCheckIndex]
                let card = cards[cardIndex]
                let matches = card.getMatches()
                if matches > 0 {
                    let nextCardsIndexes = (cardIndex + 1)...(cardIndex + matches)
                    cardsToCheck.append(contentsOf: Array(nextCardsIndexes))
                    winnedCards += matches
                }
                cardToCheckIndex += 1
            }
            return winnedCards + cards.count
        }
    }
}
