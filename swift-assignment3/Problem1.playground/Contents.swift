import UIKit

class Student {
    let name: String
    let scores: [Int]
    
    var average: Double {
        return Double(scores.reduce(0, +)) / Double(scores.count)
    }
    
    init(name: String, scores: [Int]) {
        self.name = name
        self.scores = scores
    }
}

// Creating arbitrary students
let students = [
    Student(name: "John Doe", scores: [85, 92, 78, 90]),
    Student(name: "Jane Smith", scores: [76, 88, 92, 81]),
    Student(name: "Michael Johnson", scores: [90, 94, 89, 87]),
    Student(name: "Emily Davis", scores: [82, 79, 85, 88]),
    Student(name: "David Brown", scores: [91, 84, 88, 93])
]

// Finding the top-ranked student based on average score
if let topStudent = students.max(by: { $0.average < $1.average }) {
    print("Top-ranked student:")
    print("Name:", topStudent.name)
    print("Average Score:", topStudent.average)
}

