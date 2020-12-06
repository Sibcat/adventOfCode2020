import Foundation

/*
 let input = ResourceHelper.getInput(from: "5")
 let maxId = Advent5.findMaxPassId(input)
 let myId = Advent5.findMyPassId(input)
 */

public class Advent5 {
    public static func findMaxPassId(_ input: String) -> Int? {
        let passes = input.split(separator: "\n").map { makePassId(string: String($0)) }
        return passes.max()
    }
    
    public static func findMyPassId(_ input: String) -> Int? {
        let passes = input.split(separator: "\n").map { makePassId(string: String($0)) }
        guard let min = passes.min(),
              let max = passes.max() else {
            return nil
        }
        
        let passesSet = Set<Int>(passes)
        for i in min+1..<max where !passesSet.contains(i) {
            if passes.contains(i + 1) {
                return i
            }
        }
        
        return nil
    }
    
    static func makePassId(string: String) -> Int {
        let characters = Array<Character>(string)
        
        let row = findPlace(characters: Array(characters[0..<7]), goDown: "F", goUp: "B")
        let column = findPlace(characters: Array(characters.dropFirst(7)), goDown: "L", goUp: "R")
        
        let id = row * 8 + column
        return id
    }
    
    static func findPlace(characters: [Character],
                   goDown: Character,
                   goUp: Character) -> Int {
        var lowerBound = 0
        var upperBound = (0..<characters.count).reduce(1) { result, _ -> Int in
            result * 2
        } - 1
        
        for i in 0..<characters.count - 1 {
            let midPoint = lowerBound + (upperBound - lowerBound) / 2
            if characters[i] == goDown {
                upperBound = midPoint
            } else {
                lowerBound = midPoint + 1
            }
        }
        
        return characters[characters.count - 1] == goDown ? lowerBound: upperBound
    }
}
