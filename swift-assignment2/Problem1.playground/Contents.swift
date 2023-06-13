import UIKit

struct Date {
    var day: Int
    var month: Int
    var year: Int
    
    static func convertFromNumber(_ number: Int) -> Date {
        guard number >= 1 && number <= 365 else {
            fatalError("Number should be between 1 and 365")
        }
        
        var day = number
        var month = 1
        
        let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        
        for days in daysInMonth {
            if day <= days {
                break
            }
            day -= days
            month += 1
        }
        
        return Date(day: day, month: month, year: 2023)
    }
}


let date1 = Date.convertFromNumber(150)
print(date1) // Output: Date(day: 30, month: 5, year: 2023)

let date2 = Date.convertFromNumber(365)
print(date2) // Output: Date(day: 31, month: 12, year: 2023)

let date3 = Date.convertFromNumber(200)
print(date3) // Output: Date(day: 19, month: 7, year: 2023)

enum Weekday: String {
    case sunday = "Sunday"
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    
    static func getWeekday(_ date: Date) -> Weekday? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: "\(date.year)-\(date.month)-\(date.day)") else {
            return nil
        }
        
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        
        switch weekday {
        case 1:
            return .sunday
        case 2:
            return .monday
        case 3:
            return .tuesday
        case 4:
            return .wednesday
        case 5:
            return .thursday
        case 6:
            return .friday
        case 7:
            return .saturday
        default:
            return nil
        }
    }
}

let myDate = Date(day: 10, month: 6, year: 2023)
if let weekday = Weekday.getWeekday(myDate) {
    print("The given date is \(weekday.rawValue).")
} else {
    print("Invalid date.")
}


