import UIKit



let input = ResourceHelper.getInput(from: "9")
let numbers = Advent9.parse(input)
let advent9 = Advent9.findWrongNumber(numbers, preambleLength: 25)
if let bounds = Advent9.findSequenceBounds(numbers, desiredSum: advent9) {
    let subarray = numbers[bounds]
    let sum = (subarray.min() ?? 0) + (subarray.max() ?? 0)
}
