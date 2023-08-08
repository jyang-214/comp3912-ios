//
//  Expense.swift
//  Income & Expense Tracker
//
//  Created by Jacky Yang on 2023-07-07.
//

import Foundation

import UIKit

struct Expense: Codable {
    var expenseName: String
    var date: String
    var expenseType: String
    var category: String
    var dollarAmount: Double
    var paymentType: String
    var description: String
}
