//
//  ExpensePersistenceManager.swift
//  Income & Expense Tracker
//
//  Created by Jacky Yang on 2023-07-21.
//

import Foundation

class ExpensePersistenceManager {
    static let fileName = "expense_data.json"
    
    typealias ExpenseSection = (String, [Expense])
    
    class ExpenseSectionWrapper: Codable {
        let date: String
        let expenses: [Expense]
        
        init(date: String, expenses: [Expense]) {
            self.date = date
            self.expenses = expenses
        }
        
        enum CodingKeys: String, CodingKey {
            case date
            case expenses
        }
    }
    
    static func saveData(_ data: [ExpenseSection]) {
        let wrappers = data.map { ExpenseSectionWrapper(date: $0.0, expenses: $0.1) }
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(wrappers) {
            do {
                let fileURL = try FileManager.default
                    .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                    .appendingPathComponent(fileName)
                try encodedData.write(to: fileURL)
            } catch {
                print("Failed to save data to file: \(error)")
            }
        }
    }

    static func loadData() -> [ExpenseSection] {
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent(fileName)
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()

            // Set the date decoding strategy to handle the date format
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM d, yyyy"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)

            let wrappers = try decoder.decode([ExpenseSectionWrapper].self, from: data)
            let data1 = wrappers.map { ($0.date, $0.expenses) }
            return data1
        } catch {
            print("Failed to load data from file: \(error)")
        }
        return []
    }
}


