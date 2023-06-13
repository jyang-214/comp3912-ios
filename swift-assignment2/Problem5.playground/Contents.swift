import UIKit

struct Student {
    var firstName: String
    var lastName: String
    var address: String
    var yearOfBirth: Int
    var gpa: Double
    
    func printStudent() {
        print("First Name: \(firstName)")
        print("Last Name: \(lastName)")
        print("Address: \(address)")
        print("Year of Birth: \(yearOfBirth)")
        print("GPA: \(gpa)")
    }
}

class Classroom {
    var students: [Student]
    
    init() {
        students = []
    }
    
    func generateList() {
        students = [
                Student(firstName: "John", lastName: "Doe", address: "123 Main St", yearOfBirth: 2000, gpa: 3.8),
                Student(firstName: "Jane", lastName: "Smith", address: "456 Elm St", yearOfBirth: 1999, gpa: 3.9),
                Student(firstName: "Mike", lastName: "Johnson", address: "789 Oak St", yearOfBirth: 2001, gpa: 4.0),
                Student(firstName: "Emily", lastName: "Davis", address: "321 Maple Ave", yearOfBirth: 2002, gpa: 3.7),
                Student(firstName: "Sarah", lastName: "Wilson", address: "555 Pine St", yearOfBirth: 2000, gpa: 3.5),
                Student(firstName: "Ryan", lastName: "Anderson", address: "777 Cedar Rd", yearOfBirth: 2003, gpa: 3.6),
                Student(firstName: "Olivia", lastName: "Brown", address: "999 Oak St", yearOfBirth: 2001, gpa: 3.9),
                Student(firstName: "James", lastName: "Miller", address: "222 Elm St", yearOfBirth: 1998, gpa: 3.8),
                Student(firstName: "Sophia", lastName: "Taylor", address: "444 Maple Ave", yearOfBirth: 2000, gpa: 3.4),
                Student(firstName: "David", lastName: "Lee", address: "666 Pine St", yearOfBirth: 2002, gpa: 3.7)
            ]
    }
    
    func getHighestGpa() -> Student? {
        if students.isEmpty {
            print("No students in the classroom.")
            return nil
        }
        
        var highestGpaStudent = students[0]
        for student in students {
            if student.gpa > highestGpaStudent.gpa {
                highestGpaStudent = student
            }
        }
        
        print("Student with the highest GPA:")
        highestGpaStudent.printStudent()
        return highestGpaStudent
    }
}

let classroom = Classroom()
classroom.generateList()
let highestGpaStudent = classroom.getHighestGpa()
