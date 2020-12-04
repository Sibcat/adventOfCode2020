import Foundation

/*
 1
 let input = ResourceHelper.getInput(from: "3")
 let result = Advent3.treeEncountres(input, step: (x: 3, y: 1))
 
 
 */

public class Advent3 {
    static let tree: Character = "#"
    static let freeSpot: Character = "."
    
    public static func multiplyTreesOnSlopes(_ input: String) -> Int {
        /*
         Right 1, down 1.
         Right 3, down 1. (This is the slope you already checked.)
         Right 5, down 1.
         Right 7, down 1.
         Right 1, down 2.
         */
        let steps = [
            (x: 1, y: 1),
            (x: 3, y: 1),
            (x: 5, y: 1),
            (x: 7, y: 1),
            (x: 1, y: 2)
        ]
        
        let forest = parse(input)
        return steps.reduce(1) { result, step -> Int in
            result * countTreeEncounters(forest: forest, step: step)
        }
    }
    
    public static func treeEncountres(_ input: String, step: (x: Int, y: Int)) -> Int {
        let forest = parse(input)
        return countTreeEncounters(forest: forest, step: step)
    }
    
    static func parse(_ input: String) -> [String] {
        return input.split(separator: "\n").map { String($0) }
    }
}


private extension Advent3 {
    static func countTreeEncounters(forest: [String], step: (x: Int, y: Int)) -> Int {
        guard let width = forest.first?.count else {
            return 0
        }
        
        var row = step.y
        var column = step.x
        var count = 0
        while row < forest.count {
            if column >= width {
                column -= width
            }
            
            let forestRow = forest[row]
            let index = forestRow.index(forestRow.startIndex, offsetBy: column)
            if forestRow[index] == tree {
                count += 1
            }
            
            column += step.x
            row += step.y
        }
        
        return count
    }
}
