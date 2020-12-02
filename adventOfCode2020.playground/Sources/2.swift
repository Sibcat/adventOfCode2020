import Foundation

/*
 1
 let input = ResourceHelper.getInput(from: "2")
 let result = Advent2.findValidPasswordAmount(input: input)
 */

public class Advent2 {
    
    struct PasswordPolicy {
        let range: ClosedRange<Int>
        let character: Character
    }
    
    struct Record {
        let password: String
        let policy: PasswordPolicy
        
        func isValid() -> Bool {
            var count = 0
            for char in password where char == policy.character {
                count += 1
                if count > policy.range.upperBound {
                    return false
                }
            }
            return count >= policy.range.lowerBound
        }
    }
    
    public static func findValidPasswordAmount(input: String) -> Int {
        let records = parse(input)
        return records.filter { $0.isValid() }.count
    }
}

private extension Advent2 {
    static func parse(_ input: String) -> [Record] {
        let records = input.match("([0-9]*)-([0-9]*) ([a-z]): ([a-z]*)")
            .compactMap { matches -> Record? in
                guard let min = Int(matches[1]),
                      let max = Int(matches[2]),
                      let character = matches[3].first else {
                    return nil
                }
                let range = min...max
                let policy = PasswordPolicy(range: range, character: character)
                return Record(password: matches[4], policy: policy)
            }
        
        return records
    }
}

extension String {
    func match(_ regex: String) -> [[String]] {
        let nsString = self as NSString
        let matches = (try? NSRegularExpression(pattern: regex, options: []))?
            .matches(in: self, options: [], range: NSMakeRange(0, count)).map { match in
                (0..<match.numberOfRanges).map {
                    match.range(at: $0).location == NSNotFound ? "" : nsString.substring(with: match.range(at: $0))
                }
            }
        return matches ?? []
    }
}
