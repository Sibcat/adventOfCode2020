import Foundation

/*
 let input = ResourceHelper.getInput(from: "4")
 var requiredFields = Set<Advent4.DocumentField>(Advent4.DocumentField.allCases)
 requiredFields.remove(.cid)
 let result = Advent4.countValidPasswords(input,
                                          requiredFields: requiredFields,
                                          validateFields: true)
 */

public class Advent4 {
    enum EyeColor: String {
        case amb
        case blu
        case brn
        case gry
        case grn
        case hzl
        case oth
    }
    
    public enum DocumentField: String, CaseIterable {
        case byr // (Birth Year)
        case iyr // (Issue Year)
        case eyr // (Expiration Year)
        case hgt // (Height)
        case hcl // (Hair Color)
        case ecl // (Eye Color)
        case pid // (Passport ID)
        case cid // (Country ID)
        
        func isValid(_ value: String) -> Bool {
            switch self {
            case .byr:
                let year = Int(value) ?? 0
                return 1920 <= year && year <= 2002
            case .iyr:
                let year = Int(value) ?? 0
                return 2010 <= year && year <= 2020
            case .eyr:
                let year = Int(value) ?? 0
                return 2020 <= year && year <= 2030
            case .hgt:
                let numberStr = value.prefix { $0.isNumber }
                let suffix = value.suffix(from: numberStr.endIndex)
                guard let number = Int(numberStr) else { return false }
                return suffix == "cm" && 150 <= number && number <= 193 ||
                    suffix == "in" && 59 <= number && number <= 76
            case .hcl:
                let prefix = value.prefix { $0 == "#" }
                let suffix = value.suffix(from: prefix.endIndex)
                let characterSet = CharacterSet(charactersIn: "a"..."f").union(CharacterSet.decimalDigits)
                return prefix.count == 1 && suffix.count == 6 &&
                    suffix.allSatisfy { characterSet.contains($0.unicodeScalars.first!) }
            case .ecl:
                return EyeColor(rawValue: value) != nil
            case .pid:
                return value.count == 9 && value.allSatisfy { $0.isNumber }
            case .cid:
                return true
            }
        }
    }
    
    public static func countValidPasswords(_ input: String,
                                           requiredFields: Set<DocumentField>) -> Int {
        countValidPasswords(input, requiredFields: requiredFields, validateFields: false)
    }
    
    public static func countValidPasswords(_ input: String,
                                           requiredFields: Set<DocumentField>,
                                           validateFields: Bool) -> Int {
        let passwords = input.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\n\n")
        return passwords.reduce(0) { count, password -> Int in
            let fields = password.components(separatedBy: CharacterSet.whitespacesAndNewlines)
            let presentedValidFields = fields.compactMap { field -> DocumentField? in
                let data = field.split(separator: ":").filter { !$0.isEmpty }
                if let field = DocumentField(rawValue: String(data[0])) {
                    return field.isValid(String(data[1])) ? field : nil
                }
                return nil
            }
            
            if Set<DocumentField>(presentedValidFields).isSuperset(of: requiredFields) {
                return count + 1
            }
            
            return count
        }
    }
}
