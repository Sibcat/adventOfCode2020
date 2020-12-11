import Foundation

/*
 1
 let input = ResourceHelper.getInput(from: "6")
 let count = Advent6.countAllYesAnswers(input)
 
2
 let input = ResourceHelper.getInput(from: "6")
 let count = Advent6.countCommonYesAnswers(input)
 */
public class Advent6 {
    public static func countAllYesAnswers(_ input: String) -> Int {
        let groupAnswers = input.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\n\n")
        
        return groupAnswers.reduce(0) { count, group -> Int in
            let answers = group.components(separatedBy: "\n")
            return count + countGroupAnswers(answers)
        }
    }
    
    static func countGroupAnswers(_ answers: [String]) -> Int {
        var characters = Set<Character>()
        for answer in answers {
            for character in answer.trimmingCharacters(in: .whitespaces) {
                characters.insert(character)
            }
        }
        
        return characters.count
    }
    
    public static func countCommonYesAnswers(_ input: String) -> Int {
        let groupAnswers = input.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\n\n")
        
        return groupAnswers.reduce(0) { count, group -> Int in
            let answers = group.components(separatedBy: "\n")
            return count + countCommonGroupAnswers(answers)
        }
    }
    
    static func countCommonGroupAnswers(_ answers: [String]) -> Int {
        var characters = [Character: Int]()
        for answer in answers {
            for character in answer.trimmingCharacters(in: .whitespaces) {
                characters[character] = characters[character, default: 0] + 1
            }
        }
        
        let answerCount = answers.count
        return characters.keys.filter { characters[$0, default: 0] == answerCount }.count
    }
}
