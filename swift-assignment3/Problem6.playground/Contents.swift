import UIKit

func missingNumbers(arr: [Int], brr: [Int]) -> [Int] {
    var frequencies = Array(repeating: 0, count: 10001) // Assuming the range of numbers is from 1 to 10,000

    // Count the frequencies of numbers in the first array
    for num in arr {
        frequencies[num] -= 1
    }

    // Subtract the frequencies of numbers in the second array
    for num in brr {
        frequencies[num] += 1
    }

    var missingNumbers = [Int]()

    // Find the numbers with non-zero frequencies
    for (index, frequency) in frequencies.enumerated() {
        if frequency > 0 {
            missingNumbers.append(index)
        }
    }

    return missingNumbers
}

// Test case
let arr = [7, 2, 5, 3, 5, 3]
let brr = [7, 2, 5, 4, 6, 3, 5, 3]
let result = missingNumbers(arr: arr, brr: brr)
print(result)

