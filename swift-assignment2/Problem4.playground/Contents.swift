import UIKit

class Search {
    private var numbers: [Int]

    init() {
        numbers = []
    }

    func reset() {
        numbers = []
    }

    func randomFill() {
        for _ in 1...10 {
            let randomNumber = Int.random(in: Int.min...Int.max)
            numbers.append(randomNumber)
        }
    }

    static func linearSearch(list: [Int], number: Int) -> Bool {
        for num in list {
            if num == number {
                return true
            }
        }
        return false
    }
}
