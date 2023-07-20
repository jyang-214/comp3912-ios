import UIKit

@propertyWrapper
struct CapitalCase {
    private var value: String = ""
    private var originalValue: String = ""
    private var maxLength: Int
    
    var wrappedValue: String {
        get { value }
        set { value = newValue.prefix(maxLength).uppercased() }
    }
    
    var projectedValue: Info {
        print("origianlValue before comparison is \(originalValue)")
        let capitalized = originalValue != originalValue.uppercased()
        let truncated = originalValue.count > maxLength ? originalValue.count - maxLength : 0
        return Info(capitalized: capitalized, truncated: truncated)
    }
    
    struct Info {
        var capitalized: Bool
        var truncated: Int
    }
    
    init(wrappedValue: String) {
        originalValue = wrappedValue
        self.maxLength = 5
        self.wrappedValue = wrappedValue
    }
}


struct Person {
    @CapitalCase
    var name: String = "jackyyang"
}

var person = Person()
print(person.name)  // Output: ALI
print(person.$name) // Output: Info(capitalized: true, truncated: 0)
