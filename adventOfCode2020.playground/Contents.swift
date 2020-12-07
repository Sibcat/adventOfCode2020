import UIKit




let input = ResourceHelper.getInput(from: "7")
let bagsContainingCount = Advent7.countPossibleBags(for: "shiny gold", input: input)
let bagsInside = Advent7.countBagsInside(color: "shiny gold", input: input)
