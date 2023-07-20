import UIKit

class MySort {
    var items: [Int]
    
    init(items: [Int]) {
        self.items = items
    }
    
    var sorting: ([Int]) -> Void {
        fatalError("Subclasses must override the 'sorting' property.")
    }
}

class MyBubbleSort: MySort {
    override var sorting: ([Int]) -> Void {
        return { items in
            var sortedItems = items
            let n = sortedItems.count
            for i in 0..<n {
                for j in 0..<(n-i-1) {
                    if sortedItems[j] > sortedItems[j+1] {
                        sortedItems.swapAt(j, j+1)
                    }
                }
            }
            self.items = sortedItems
        }
    }
}

class MyInsertionSort: MySort {
    override var sorting: ([Int]) -> Void {
        return { items in
            var sortedItems = items
            let n = sortedItems.count
            for i in 1..<n {
                let key = sortedItems[i]
                var j = i - 1
                while j >= 0 && sortedItems[j] > key {
                    sortedItems[j+1] = sortedItems[j]
                    j -= 1
                }
                sortedItems[j+1] = key
            }
            self.items = sortedItems
        }
    }
}

// Example usage
let bubbleSort = MyBubbleSort(items: [5, 2, 8, 1, 9])
bubbleSort.sorting(bubbleSort.items)
print("Bubble Sort Result: \(bubbleSort.items)")

let insertionSort = MyInsertionSort(items: [5, 2, 8, 1, 9])
insertionSort.sorting(insertionSort.items)
print("Insertion Sort Result: \(insertionSort.items)")
