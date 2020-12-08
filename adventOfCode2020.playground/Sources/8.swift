import Foundation

/*
 let input = ResourceHelper.getInput(from: "8")
 let advent8 = Advent8.calcBeforeLoop(input)
 let fixLoop = Advent8.fixLoop(input)
 */

public class Advent8 {
    enum Operation: String {
        case nop
        case acc
        case jmp
    }
    
    struct Instruction {
        let op: Operation
        let value: Int
    }
    
    public static func calcBeforeLoop(_ input: String) -> Int {
        let instructions = makeInstructions(input: input)

        var visited = Set<Int>()
        var accumulator = 0
        var index = 0
        while 0 <= index && index < instructions.count && !visited.contains(index) {
            visited.insert(index)
            switch instructions[index].op {
            case .nop:
                index += 1
            case .acc:
                accumulator += instructions[index].value
                index += 1
            case .jmp:
                index += instructions[index].value
            }
        }
        
        return accumulator
    }
    
    public static func fixLoop(_ input: String) -> Int {
        let instructions = makeInstructions(input: input)

        var indexToFix = 0
        var accumulator = 0
        while indexToFix < instructions.count {
            indexToFix += 1
            
            switch instructions[indexToFix].op {
            case .acc:
                continue
            default:
                break
            }
            
            var visited = Set<Int>()
            var index = 0
            accumulator = 0
            while 0 <= index && index < instructions.count && !visited.contains(index) {
                visited.insert(index)
                switch instructions[index].op {
                case .nop:
                    index += index == indexToFix ? instructions[index].value : 1
                case .acc:
                    accumulator += instructions[index].value
                    index += 1
                case .jmp:
                    index += index == indexToFix ? 1 : instructions[index].value
                }
            }
            
            if index == instructions.count {
                break
            }
        }
    
        return accumulator
    }
    
    static func makeInstructions(input: String) -> [Instruction] {
        return input.split(separator: "\n").compactMap { string -> Instruction? in
            let parts = string.split(separator: " ")
            guard parts.count == 2,
                  let operation = Operation(rawValue: String(parts[0])),
                  let number = Int(parts[1]) else {
                return nil
            }

            return Instruction(op: operation, value: number)
        }
    }
}
