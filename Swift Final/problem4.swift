import Foundation

protocol Protocol1 {
  var property1: Int? { get set }
}

protocol Protocol2 {
  var property2: String { get }
}

protocol Protocol3 {
  var property3: (Int?) -> String { get }
}

// 1

class MyProtocolConformingClass: Protocol1, Protocol2, Protocol3 {
  var property1: Int?
  var property2: String
  var property3: (Int?) -> String

  init(property1: Int?, property2: String, property3: @escaping (Int?) -> String) {
    self.property1 = property1
    self.property2 = property2
    self.property3 = property3
  }
}

var list1: [MyProtocolConformingClass] = []

let obj1 = MyProtocolConformingClass(
  property1: 42, property2: "Hello",
  property3: { value in
    if let value = value {
      return "Received value: \(value)"
    } else {
      return "Value is nil"
    }
  })

let obj2 = MyProtocolConformingClass(
  property1: nil, property2: "World",
  property3: { value in
    if let value = value {
      return "Received value: \(value)"
    } else {
      return "Value is nil"
    }
  })

list1.append(obj1)
list1.append(obj2)

for obj in list1 {
  print("Property1: \(obj.property1 ?? -1)")
  print("Property2: \(obj.property2)")
  let result = obj.property3(obj.property1)
  print("Property3: \(result)")
  print("-----")
}

// 2

protocol AllProtocols: Protocol1, Protocol2, Protocol3 {}

class MyClass: AllProtocols {
  var property1: Int?
  var property2: String
  var property3: (Int?) -> String

  init(property1: Int?, property2: String, property3: @escaping (Int?) -> String) {
    self.property1 = property1
    self.property2 = property2
    self.property3 = property3
  }
}

var myDictionary: [String: AllProtocols] = [:]

let instance1 = MyClass(
  property1: 42, property2: "Hello",
  property3: { intValue in
    if let intValue = intValue {
      return "Value: \(intValue)"
    } else {
      return "No value"
    }
  })

myDictionary["element1"] = instance1

if let element1 = myDictionary["element1"] {
  print(element1.property1)
  print(element1.property2)
  print(element1.property3(42))
  print(element1.property3(nil))
}
