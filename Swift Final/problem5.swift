import Foundation

struct Item {
  let name: String
  let weight: Int
}

class Suitcase {
  var items: [Item] = []

  func addItem(name: String, weight: Int) {
    let newItem = Item(name: name, weight: weight)
    items.append(newItem)
  }

  func totalWeight() -> Int {
    var total = 0
    for item in items {
      total += item.weight
    }
    return total
  }

  func itemWithHighestWeight() -> Item? {
    guard !items.isEmpty else { return nil }
    var highestWeightItem = items[0]
    for item in items {
      if item.weight > highestWeightItem.weight {
        highestWeightItem = item
      }
    }
    return highestWeightItem
  }

  func sortItemsByWeight() -> [Item] {
    return items.sorted { $0.weight < $1.weight }
  }
}

let suitcase = Suitcase()
suitcase.addItem(name: "key", weight: 50)
suitcase.addItem(name: "battery", weight: 40)
suitcase.addItem(name: "watch", weight: 100)
suitcase.addItem(name: "ring", weight: 30)
suitcase.addItem(name: "iPhone", weight: 300)
suitcase.addItem(name: "Cup", weight: 250)
suitcase.addItem(name: "Notebook", weight: 150)

let totalWeight = suitcase.totalWeight()
print("Total weight of items in the suitcase: \(totalWeight) grams")

if let itemWithHighestWeight = suitcase.itemWithHighestWeight() {
  print(
    "Item with highest weight: \(itemWithHighestWeight.name) (\(itemWithHighestWeight.weight) grams)"
  )
}

let sortedItems = suitcase.sortItemsByWeight()
print("Items sorted by weight:")
for item in sortedItems {
  print("\(item.name) (\(item.weight) grams)")
}
