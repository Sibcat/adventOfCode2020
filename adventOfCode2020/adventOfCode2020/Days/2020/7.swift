import Foundation

/*
 1
 let input = ResourceHelper.getInput(from: "7")
 let count = Advent7.countPossibleBags(for: "shiny gold", input: input)
 
 2
 let input = ResourceHelper.getInput(from: "7")
 let bagsContainingCount = Advent7.countPossibleBags(for: "shiny gold", input: input)
 let bagsInside = Advent7.countBagsInside(color: "shiny gold", input: input)

 */

public class Advent7 {

    public static func countPossibleBags(for color: String, input: String) -> Int {
        let rules = makeRules(input: input)
        var hasSearchedColor = Set<String>()
        
        func findSearchedColor(in currentColor: String) {
            guard let containedColors = rules[currentColor] else {
                return
            }
            
            for containedColor in containedColors {
                if containedColor.1 == color {
                    hasSearchedColor.insert(currentColor)
                    continue
                }
                
                findSearchedColor(in: containedColor.1)
                
                if hasSearchedColor.contains(containedColor.1) {
                    hasSearchedColor.insert(currentColor)
                }
            }
        }
        
        for currentColor in rules.keys {
            findSearchedColor(in: currentColor)
        }
        
        return hasSearchedColor.count
    }
    
    public static func countBagsInside(color: String, input: String) -> Int {
        let rules = makeRules(input: input)
        
        func countBagsInside(currentColor: (Int, String)) -> Int {
            let insideColors = rules[currentColor.1] ?? []
            var count = 0
            for insideColor in insideColors {
                count += countBagsInside(currentColor: insideColor)
            }
            
            return count * currentColor.0 + currentColor.0
        }
        
        return countBagsInside(currentColor: (1, color)) - 1
    }
    
    static func makeRules(input: String) -> [String: [(Int, String)]] {
        let lines = input.split(separator: "\n")
        var colors = [String: [(Int, String)]]()
        
        for line in lines {
            let parts = line.components(separatedBy: " bags contain ")
            if parts.count < 2 || parts[1] == "no other bags." {
                continue
            }
            
            let color = parts[0]
            let insideBags = parts[1].components(separatedBy: ", ")
            for insideBag in insideBags {
                let matches = insideBag.match("([0-9]+) (.*) bag")
                guard !matches.isEmpty,
                   matches[0].count >= 3,
                   let count = Int(matches[0][1]) else {
                    continue
                }
                var insideColors = colors[color, default: []]
                insideColors.append((count, matches[0][2]))
                colors[color] = insideColors
            }
        }
        
        return colors
    }
}

extension String {
    // ["match", "group1", "group2"....]
    fileprivate func match(_ regex: String) -> [[String]] {
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
