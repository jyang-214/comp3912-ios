import Foundation

class MyNotification {
    var seen = false
    static var predicate1Holds = 0
    static var predicate1Total = 0
    static var predicate2Holds = 0
    static var predicate2Total = 0

    static let predicate1Tag = 1
    static let predicate2Tag = 2

    static func searchIt(numbers: [Int], predicate: (Int) -> Bool, tag: Int) {
        for number in numbers {
            if predicate(number) {
                if tag == predicate1Tag {
                    predicate1Holds += 1
                    predicate1Total += number
                } else if tag == predicate2Tag {
                    predicate2Holds += 1
                    predicate2Total += number
                }
                MyObserver.inform(tag: tag, holds: true, number: number)
            }
        }
    }

    static func fillIt(size: Int) -> [Int] {
        var numbers = [Int]()
        for _ in 0..<size {
            let randomNumber = Int.random(in: 1...100)
            numbers.append(randomNumber)
        }
        return numbers
    }
}

class MyObserver {
    static func inform(tag: Int, holds: Bool, number: Int) {
        if tag == MyNotification.predicate1Tag {
            if holds {
                print("Predicate1: number of holds: \(MyNotification.predicate1Holds) total: \(MyNotification.predicate1Total)")
            }
        } else if tag == MyNotification.predicate2Tag {
            if holds {
                print("Predicate2: number of holds: \(MyNotification.predicate2Holds) total: \(MyNotification.predicate2Total)")
            }
        }
    }
}

// Predicates
let predicate1: (Int) -> Bool = { number in
    return number % 3 == 0
}

let predicate2: (Int) -> Bool = { number in
    return number % 2 == 0
}

// Generate an array of numbers using fillIt method
let numbers = MyNotification.fillIt(size: 10)

// Call searchIt method with predicate1
MyNotification.searchIt(numbers: numbers, predicate: predicate1, tag: MyNotification.predicate1Tag)

// Call searchIt method with predicate2
MyNotification.searchIt(numbers: numbers, predicate: predicate2, tag: MyNotification.predicate2Tag)
