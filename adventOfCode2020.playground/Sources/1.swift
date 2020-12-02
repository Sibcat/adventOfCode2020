import Foundation

/*
 1
 let input = ResourceHelper.getInput(from: "1")
 let result = Advent1.multiplyTwoEntriesThatSumTo2020(from: input)
 
 2
 let input = ResourceHelper.getInput(from: "1")
 let result = Advent1.multiplyThreeEntriesThatSum(from: input)
 */

public class Advent1 {
    public static func multiplyTwoEntriesThatSum(from input: String, desiredSum: Int = 2020) -> Int? {
        let nums = makeNums(from: input)
        return multiplyTwoEntriesThatSum(from: nums, desiredSum: desiredSum)
    }
    
    public static func multiplyThreeEntriesThatSum(from input: String, desiredSum: Int = 2020) -> Int? {
        let nums = makeNums(from: input)
        return multiplyThreeEntriesThatSum(from: nums, desiredSum: desiredSum)
    }
}

private extension Advent1 {
    static func makeNums(from input: String) -> Set<Int> {
        return Set<Int>(
            input.split(separator: "\n")
                .compactMap { Int($0) }
        )
    }
    
    static func multiplyTwoEntriesThatSum(from nums: Set<Int>, desiredSum: Int) -> Int? {
        for num in nums {
            let numToSearch = desiredSum - num
            if nums.contains(numToSearch) {
                return num * numToSearch
            }
        }
        
        return nil
    }
    
    static func multiplyThreeEntriesThatSum(from nums: Set<Int>, desiredSum: Int) -> Int? {
        var currentNums = nums
        
        for num in nums {
            let nextDesiredSum = desiredSum - num
            currentNums.remove(num)
            if let multResult = multiplyTwoEntriesThatSum(from: currentNums, desiredSum: nextDesiredSum) {
                return multResult * num
            }
        }
        
        return nil
    }
}

