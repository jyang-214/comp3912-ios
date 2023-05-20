import Foundation

//Problem 1 & 2
//====================================================
//----------------------------------------------------
var func1: (Int, Int) -> Int
func func1Function(num1: Int, num2: Int) -> Int {
  return num1 + num2
}
func1 = func1Function(num1:num2:)
func1(1, 2)  // test func1
//----------------------------------------------------
var func2: (String) -> Void
func func2Function(s: String) {
  print(s)
}
func2 = func2Function(s:)
func2("Hello MacBook Pro!")
//----------------------------------------------------
let func3: () -> Int = {
  let var1 = 1
  let var2 = 2
  return var1 + var2
}

let result = func3()
print(result)
//----------------------------------------------------
let func4: () -> [() -> Void] = {
  func innerFunc1() {
    print("Inner Function 1")
  }

  func innerFunc2() {
    print("Inner Function 2")
  }

  return [innerFunc1, innerFunc2]
}

let functions = func4()
for function in functions {
  function()
}
//----------------------------------------------------
let func5: ([(Int) -> Void]) -> [String] = { closures in
  var results: [String] = []
  var count = 0

  for closure in closures {
    closure(count)
    results.append(String(count))
    count += 1
  }

  return results
}

let closures5: [(Int) -> Void] = [
  { num in print("Closure 1: \(num)") },
  { num in print("Closure 2: \(num)") },
]

let output = func5(closures5)
print(output)
//----------------------------------------------------
var func6: ([(Int) -> Void]) -> [(Int) -> Void] = { closures in
  var modifiedClosures: [(Int) -> Void] = []

  for closure in closures {
    let modifiedClosure: (Int) -> Void = { num in
      print("Modified Closure: \(num)")
      closure(num * 2)
    }
    modifiedClosures.append(modifiedClosure)
  }

  return modifiedClosures
}

let closures6: [(Int) -> Void] = [
  { num in print("Closure 1: \(num)") },
  { num in print("Closure 2: \(num)") },
]

let modifiedClosures6 = func6(closures6)
for closure in modifiedClosures6 {
  closure(10)
}
//----------------------------------------------------
var func7: ([(Int) -> Void]?) -> [(Int) -> Void]? = { closures in
  guard let closures = closures else {
    return nil
  }

  var modifiedClosures: [(Int) -> Void] = []

  for closure in closures {
    let modifiedClosure: (Int) -> Void = { num in
      print("Modified Closure: \(num)")
      closure(num * 2)
    }
    modifiedClosures.append(modifiedClosure)
  }

  return modifiedClosures
}

let closures7: [(Int) -> Void] = [
  { num in print("Closure 1: \(num)") },
  { num in print("Closure 2: \(num)") },
]

let modifiedClosures7 = func7(closures7)
print(modifiedClosures7 ?? "Modified closures are nil")

let nilResult7 = func7(nil)
print(nilResult7 ?? "nilResult7 is nil")
//----------------------------------------------------
var func8: ([(Int) -> Void]?) -> [(Int) -> Void]? = { closures in
  guard let closures = closures else {
    return nil
  }

  var modifiedClosures: [(Int) -> Void] = []

  for closure in closures {
    let modifiedClosure: (Int) -> Void = { num in
      print("Modified Closure: \(num)")
      closure(num * 2)
    }
    modifiedClosures.append(modifiedClosure)
  }

  return modifiedClosures
}

let closures8: [(Int) -> Void] = [
  { num in print("Closure 1: \(num)") },
  { num in print("Closure 2: \(num)") },
]

let modifiedClosures8 = func8(closures8)
print(modifiedClosures8 ?? "Modified closures are nil")

let nilResult8 = func8(nil)
print(nilResult8 ?? "nilResult8 is nil")
//----------------------------------------------------
var func9: () -> ((Int) -> Int, Int)? = {
  let innerFunc: (Int) -> Int = { num in
    return num * 2
  }

  let value = 10

  return (innerFunc, value)
}

if let result = func9() {
  let innerFunc = result.0
  let value = result.1

  let output = innerFunc(value)
  print(output)
}

//Problem 3
//====================================================
//----------------------------------------------------
let operations: [String] = ["sum", "division", "difference", "power", "multiplication"]

func sum(num1: Int, num2: Int) -> Double {
  return Double(num1 + num2)
}

func division(num1: Int, num2: Int) -> Double {
  return Double(num1) / Double(num2)
}

func difference(num1: Int, num2: Int) -> Double {
  return Double(num1 - num2)
}

func power(num1: Int, num2: Int) -> Double {
  return pow(Double(num1), Double(num2))
}

func multiplication(num1: Int, num2: Int) -> Double {
  return Double(num1 * num2)
}

let operationDictionary: [String: (Int, Int) -> Double] = [
  "sum": sum,
  "division": division,
  "difference": difference,
  "power": power,
  "multiplication": multiplication,
]

func calculator(num1: Int, num2: Int, op: String) -> (Double, (Int, Int) -> Double)? {
  if let operationFunction = operationDictionary[op] {
    let result = operationFunction(num1, num2)
    return (result, operationFunction)
  } else {
    return nil
  }
}

for operation in operations {
  if let result = calculator(num1: 10, num2: 20, op: operation) {
    print("\(operation): \(result.0)")
  }
}

//Problem 4
//====================================================
//----------------------------------------------------
func sorter(_ list:[String]?, criteria by: (String, String)->Bool) -> [String]? {
    guard let words = list else{return nil}
    let sortedWords = words.sorted(by: by)
    return sortedWords
}

let list1 = ["one", "two", "three", "four", "five"]
let criteria1: (String, String) -> Bool = {(string1: String, string2: String)-> Bool in return string1 < string2}
let sortedList1 = sorter(list1, criteria: criteria1)
print(sortedList1)

let list2 = ["one", "two", "three", "four", "five"]
let criteria2: (String, String) -> Bool = {(string1: String, string2: String)-> Bool in return string1 > string2}
let sortedList2 = sorter(list2, criteria: criteria2)
print(sortedList2)

let list3 = ["aa", "aba", "b", "aabbb"]
let criteria3: (String, String) -> Bool = {(string1: String, string2: String)-> Bool in return string1.count > string2.count}
let sortedList3 = sorter(list3, criteria: criteria3)
print(sortedList3)

//Problem 5
//====================================================
//----------------------------------------------------
