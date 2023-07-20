import UIKit

struct Circle {
    let radius: Double
    static let PI = 3.14
    
    var area: Double {
        return Circle.PI * radius * radius
    }
}

// Creating an instance of Circle with radius 2.5
let circle1 = Circle(radius: 2.5)

// Accessing the radius property of circle1
print("Circle 1 radius: \(circle1.radius)") // Output: Circle 1 radius: 2.5

// Accessing the area property of circle1
print("Circle 1 area: \(circle1.area)") // Output: Circle 1 area: 19.625

// Creating another instance of Circle with radius 5.0
let circle2 = Circle(radius: 5.0)

// Accessing the radius property of circle2
print("Circle 2 radius: \(circle2.radius)") // Output: Circle 2 radius: 5.0

// Accessing the area property of circle2
print("Circle 2 area: \(circle2.area)") // Output: Circle 2 area: 78.5
