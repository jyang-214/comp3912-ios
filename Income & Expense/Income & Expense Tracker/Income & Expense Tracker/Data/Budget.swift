//
//  Budget.swift
//  Income & Expense Tracker
//
//  Created by Jacky Yang on 2023-08-07.
//

import Foundation

struct Budget: Codable {
    var groceryAmount: String
    var restaurantAmount: String
    var gasAmount: String
    var entertainmentAmount: String
    var recurringBillsAmount: String
    var othersAmount: String
    
    static func loadFromJSONFile() -> Budget? {
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentsDirectory.appendingPathComponent("budgets.json")
                do {
                    let jsonData = try Data(contentsOf: fileURL)
                    let decoder = JSONDecoder()
                    let budget = try decoder.decode(Budget.self, from: jsonData)
                    return budget
                } catch {
                    print("Error loading budgets: \(error)")
                }
            }
            return nil
        }
}
