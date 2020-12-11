import Foundation

/*
 let input = ResourceHelper.getInput(from: "9")
 let numbers = Advent9.parse(input)
 let advent9 = Advent9.findWrongNumber(numbers, preambleLength: 25)
 if let bounds = Advent9.findSequenceBounds(numbers, desiredSum: advent9) {
     let subarray = numbers[bounds]
     let sum = (subarray.min() ?? 0) + (subarray.max() ?? 0)
 }
 */

public class Advent9 {
    public static func findWrongNumber(_ input: String, preambleLength: Int = 25) -> Int {
        let numbers = parse(input)
        return findWrongNumber(numbers, preambleLength: preambleLength)
    }
    
    public static func findWrongNumber(_ numbers: [Int], preambleLength: Int = 25) -> Int {
        guard numbers.count > preambleLength else {
            return -1
        }
        
        var set = Set<Int>(numbers.prefix(preambleLength))
        
        for i in preambleLength..<numbers.count {
            let currentNumber = numbers[i]
            if Advent1.findTwoNumbers(in: set, withSumEqualTo: currentNumber) != nil {
                set.remove(numbers[i - preambleLength])
                set.insert(currentNumber)
            } else {
                return currentNumber
            }
        }
        
        return -1
    }
    
    public static func findSequenceBounds(_ numbers: [Int], desiredSum: Int) -> ClosedRange<Int>? {
        guard let desiredSumIndex = numbers.firstIndex(of: desiredSum),
              desiredSumIndex > 2 else {
            return nil
        }
        
        var min = 0
        var max = 1
        
        var sum = numbers[min] + numbers[max]
        while max < desiredSumIndex {
            if sum == desiredSum {
                return min...max
            }
            
            if sum < desiredSum {
                max += 1
                sum += numbers[max]
            } else {
                sum -= numbers[min]
                min += 1
            }
        }
        
        return nil
    }
    
    public static func parse(_ input: String) -> [Int] {
        return input.split(separator: "\n").compactMap { Int(String($0)) }
    }
}
