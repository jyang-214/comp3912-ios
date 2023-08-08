protocol StringConditionProtocol {
    // It checks whether a given condition is met on the current string
    func verifiableStringForACondition(_ conditionPredicate: (String) -> Bool) -> Bool
    
    // It checks whether the string is a double repeated string.
    // For instance, "abab" is a double repeated string because "ab" is repeated 2 times.
    // Similarly, "AliAli" is also a double repeated string.
    func repeatedString() -> Bool
}

struct MyString: StringConditionProtocol {
    private var value: String
    
    init(_ value: String) {
        self.value = value
    }
    
    func verifiableStringForACondition(_ conditionPredicate: (String) -> Bool) -> Bool {
        return conditionPredicate(value)
    }
    
    func repeatedString() -> Bool {
        let halfLength = value.count / 2
        let firstHalf = String(value.prefix(halfLength))
        let secondHalf = String(value.suffix(halfLength))
        
        return firstHalf == secondHalf
    }
}

// Example usage:
let string1 = MyString("abab")
let string2 = MyString("AliAli")
let string3 = MyString("abcdef")

print(string1.repeatedString())
print(string2.repeatedString())
print(string3.repeatedString())

// Example usage of verifiableStringForACondition(_:)
let containsLetterA = string1.verifiableStringForACondition { str in
    return str.contains("a")
}
print(containsLetterA)
