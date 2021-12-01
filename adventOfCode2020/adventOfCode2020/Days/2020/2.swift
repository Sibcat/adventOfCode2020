import Foundation

/*
 1
 let input = ResourceHelper.getInput(from: "2")
 let result = Advent2.findValidPasswordAmount(input: input)
 */

protocol PasswordPolicy {
    func isValid(_ password: String) -> Bool
}

public class Advent2 {
    
    struct Record {
        let password: String
        let policy: PasswordPolicy
    }
    
    public static func findValidPasswordAmountForRental(input: String) -> Int {
        let records = parse(input, recordFactoryMethod: makeRecordWithRentalPolicy(from:))
        return records.filter { $0.policy.isValid($0.password) }.count
    }
    
    public static func findValidPasswordAmountForTobbogan(input: String) -> Int {
        let records = parse(input, recordFactoryMethod: makeRecordWithTobboganPolicy(from:))
        return records.filter { $0.policy.isValid($0.password) }.count
    }
    
    static func parse(_ input: String, recordFactoryMethod: ([String]) -> Record?) -> [Record] {
        return input.match("([0-9]*)-([0-9]*) ([a-z]): ([a-z]*)")
            .compactMap(recordFactoryMethod)
    }
}

// Rental
private extension Advent2 {
    struct RentalPlacePolicy: PasswordPolicy {
        let range: ClosedRange<Int>
        let character: Character
        
        func isValid(_ password: String) -> Bool {
            var count = 0
            for char in password where char == character {
                count += 1
                if count > range.upperBound {
                    return false
                }
            }
            return count >= range.lowerBound
        }
    }
    
    static func makeRecordWithRentalPolicy(from matches: [String]) -> Record? {
        guard let min = Int(matches[1]),
              let max = Int(matches[2]),
              let character = matches[3].first else {
            return nil
        }
        let range = min...max
        let policy = RentalPlacePolicy(range: range, character: character)
        return Record(password: matches[4], policy: policy)
    }
}

// Toboggan Corporate
private extension Advent2 {
    struct TobboganPolicy: PasswordPolicy {
        let firstPosition: Int
        let secondPosition: Int
        let character: Character
        
        func isValid(_ password: String) -> Bool {
            let first = password.index(password.startIndex, offsetBy: firstPosition - 1)
            let second = password.index(password.startIndex, offsetBy: secondPosition - 1)
            return password[first] == character && password[second] != character ||
                password[second] == character && password[first] != character
        }
    }
    
    static func makeRecordWithTobboganPolicy(from matches: [String]) -> Record? {
        guard let firstPosition = Int(matches[1]),
              let secondPosition = Int(matches[2]),
              let character = matches[3].first else {
            return nil
        }
        let policy = TobboganPolicy(firstPosition: firstPosition,
                                    secondPosition: secondPosition,
                                    character: character)
        return Record(password: matches[4], policy: policy)
    }
}
