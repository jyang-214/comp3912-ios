import Foundation

// 1
struct Ellipse {
    var a: Double
    var b: Double
}

let ellipse1 = Ellipse(a: 5, b: 5)
let ellipse2 = Ellipse(a: 3, b: 8)
let ellipse3 = Ellipse(a: 2, b: 2)


// 2
class File {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class Directory {
    let name: String
    var files: [File]
    var subdirectories: [Directory]
    
    init(name: String) {
        self.name = name
        self.files = []
        self.subdirectories = []
    }
}

let iosProject = Directory(name: "IOSProject")

let assignments = Directory(name: "Assignments")
let lectures = Directory(name: "Lectures")
let courseInfoFile = File(name: "Courseinfo.txt")
let sampleExamFile = File(name: "sampleExam.pdf")

iosProject.subdirectories = [assignments, lectures]
iosProject.files = [courseInfoFile, sampleExamFile]

print(iosProject.name)
print(iosProject.files)
print(iosProject.subdirectories)
