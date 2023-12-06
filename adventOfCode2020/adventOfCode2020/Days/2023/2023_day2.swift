//
//  2023_day2.swift
//  adventOfCode2020
//
//  Created by Elena Skvortsova on 06/12/2023.
//

import Foundation

extension Advent2023 {
    
    typealias CubeGame = [String: Int]
    
    static func getMinAmountOfCubesInGames(from inputStrings: [String]) -> [CubeGame] {
        let games = inputStrings.compactMap { input -> [String: Int]? in
            // probably could be done faster by using indexes but I don't want to
            guard let gameInfo = input.split(separator: ":").last else { return nil }
            let gameTries = gameInfo.split(separator: "; ")
            var game: CubeGame = [:]
            for gameTry in gameTries {
                let gameComponents = gameTry.trimmingCharacters(in: [" "]).split(separator: ",")
                print(gameComponents)
                for gameComponent in gameComponents {
                    let cubeInfo = gameComponent.trimmingCharacters(in: [" "]).split(separator: " ")
                    let cubeCount = Int(cubeInfo[0]) ?? 0
                    let cubeColor = String(cubeInfo[1])
                    let currentCubeCount = game[cubeColor, default: 0]
                    game[cubeColor] = max(currentCubeCount, cubeCount)
                }
            }
            return game
        }
        
        return games
    }
    
    static func getSumOfPossibleGames(for configuration: CubeGame, in games: [CubeGame]) -> Int {
        var sum = 0
        for (index, game) in games.enumerated() {
            var enoughCubesInConfig = true
            for cubeColor in configuration.keys {
                if configuration[cubeColor, default: 0] < game[cubeColor, default: 0] {
                    enoughCubesInConfig = false
                }
            }
            if enoughCubesInConfig {
                sum += index + 1
                print(index + 1)
            }
        }
        return sum
    }
    
    static func getMinCubesCountPower(from games: [CubeGame]) -> Int {
        var sum = 0
        for game in games {
            sum += game.values.reduce(1, *)
        }
        return sum
    }
}
