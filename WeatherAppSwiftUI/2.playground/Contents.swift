import Foundation

class Student{
    private var age = 10
    private var email = ""
    private var takenCourses = 6
    private var gpa = 68
    
    init(_ age: Int, _ email: String, _ takenCourses: Int, _ gpa: Int){
        self.age = age
        self.email = email
        self.takenCourses = takenCourses
        self.gpa = gpa
    }
    
    func getAge() -> Int {
        return age
    }
    
    func getEmail() -> String {
        return email
    }
    
    func getTakenCourses() -> Int {
        return takenCourses
    }
    
    func getGPA() -> Int {
        return gpa
    }
}

class Search{
    static func searchForStudents(list students: [Student], with condition: (Student)->Bool, their specification: (Student)->String,
                                  action perform: (String)->Void){
        
        for student in students{
            if condition(student){
                let spec = specification(student)
                perform(spec)
            }
        }
    }
}

let st1 = Student(23, "a.gmail.com", 5, 78)
let st2 = Student(22, "b.gmail.com", 8, 72)
let st3 = Student(19, "c.gmail.com", 7, 63)
let st4 = Student(25, "d.gmail.com", 6, 81)
let st5 = Student(24, "e.gmail.com", 4, 66)
let st6 = Student(22, "f.gmail.com", 7, 81)

var students:[Student] = []
students.append(st1)
students.append(st2)
students.append(st3)
students.append(st4)
students.append(st5)
students.append(st6)

// 1
//let condition: (Student) -> Bool = { student in
//    return student.getAge() > 22
//}
//
//let specification: (Student) -> String = { student in
//    return student.getEmail()
//}
//
//let perform: (String) -> Void = { email in
//    print(email)
//}
//
//Search.searchForStudents(list: students, with: condition, their: specification, action: perform)

// 2
//let condition: (Student) -> Bool = { student in
//    return student.getAge() >= 20 && student.getAge() <= 23
//}
//
//let specification: (Student) -> String = { student in
//    return student.getEmail()
//}
//
//let perform: (String) -> Void = { email in
//    print(email)
//}
//
//Search.searchForStudents(list: students, with: condition, their: specification, action: perform)

// 3
//let condition: (Student) -> Bool = { student in
//    return student.getTakenCourses() > 5
//}
//
//let specification: (Student) -> String = { student in
//    return "Email: \(student.getEmail()), GPA: \(student.getGPA())"
//}
//
//let perform: (String) -> Void = { info in
//    print(info)
//}
//
//Search.searchForStudents(list: students, with: condition, their: specification, action: perform)

// 4
let specification: (Student) -> String = { student in
    return "Email: \(student.getEmail()), GPA: \(student.getGPA()), Age: \(student.getAge()), Courses: \(student.getTakenCourses())"
}

let perform: (String) -> Void = { info in
    print(info)
}

Search.searchForStudents(list: students, with: { _ in true }, their: specification, action: perform)



