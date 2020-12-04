import UIKit

let input = ResourceHelper.getInput(from: "4")
var requiredFields = Set<Advent4.DocumentField>(Advent4.DocumentField.allCases)
requiredFields.remove(.cid)
let result = Advent4.countValidPasswords(input,
                                         requiredFields: requiredFields,
                                         validateFields: true)

