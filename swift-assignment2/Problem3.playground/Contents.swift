import UIKit

enum Calculator {
    case Sum((Int, Int) -> Int)
    case Subtraction((Int, Int) -> Int)
    case Multiplication((Int, Int) -> Int)
    case Division((Int, Int) -> Int)
    
    static func calculate(num1: Int, num2: Int, operation: Calculator?) -> Int? {
        guard let operation = operation else {
            return nil
        }
        
        switch operation {
        case .Sum(let operation):
            return operation(num1, num2)
        case .Subtraction(let operation):
            return operation(num1, num2)
        case .Multiplication(let operation):
            return operation(num1, num2)
        case .Division(let operation):
            return operation(num1, num2)
        }
    }
}

let num1 = 10
let num2 = 5

let sumResult = Calculator.calculate(num1: num1, num2: num2, operation: .Sum(+))
print("Sum Result: \(sumResult ?? 0)") // Output: Sum Result: 15

let subtractionResult = Calculator.calculate(num1: num1, num2: num2, operation: .Subtraction(-))
print("Subtraction Result: \(subtractionResult ?? 0)") // Output: Subtraction Result: 5

let multiplicationResult = Calculator.calculate(num1: num1, num2: num2, operation: .Multiplication(*))
print("Multiplication Result: \(multiplicationResult ?? 0)") // Output: Multiplication Result: 50

let divisionResult = Calculator.calculate(num1: num1, num2: num2, operation: .Division(/))
print("Division Result: \(divisionResult ?? 0)") // Output: Division Result: 2
