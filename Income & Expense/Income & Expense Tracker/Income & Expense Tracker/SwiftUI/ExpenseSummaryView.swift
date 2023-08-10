//
//  LinkedViewController.swift
//  Income & Expense Tracker
//
//  Created by Jacky Yang on 2023-08-07.
//

import SwiftUI

struct ExpenseSummaryView: View {
    var body: some View {
        VStack {
            calculateAndPrintCategorySums()
        }
        VStack {
            BarChart(categories: getCategorySumsForChart())
                .frame(maxWidth: .infinity)
                .padding()
        }
    }
    
    func calculateAndPrintCategorySums() -> some View {
        let loadedData = ExpensePersistenceManager.loadData()
        var categorySums: [String: Double] = [:]
        
        for expenseSection in loadedData {
            for expense in expenseSection.1 {
                let category = expense.category
                let amount = expense.dollarAmount
                categorySums[category, default: 0.0] += amount
            }
        }
        
        return VStack {
            ForEach(categorySums.sorted(by: { $0.key < $1.key }), id: \.key) { category, sum in
                Text("\(category): $\(String(format: "%.2f", sum))")
            }
        }
    }
    
    func getCategorySumsForChart() -> [BarChartData] {
        let loadedData = ExpensePersistenceManager.loadData()
        var categorySums: [String: Double] = [:]
        
        for expenseSection in loadedData {
            for expense in expenseSection.1 {
                let category = expense.category
                let amount = expense.dollarAmount
                categorySums[category, default: 0.0] += amount
            }
        }
        return categorySums.map { BarChartData(category: $0.key, value: $0.value) }
    }
}

struct BarChartData {
    let category: String
    let value: Double
}

struct BarChart: View {
    let categories: [BarChartData]
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(categories.sorted(by: { $0.value > $1.value }), id: \.category) { data in
                HStack(alignment: .center) { // Set alignment to .center
                    Text("\(data.category)")
                        .frame(width: 100, alignment: .leading)
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: CGFloat(data.value/10), height: 20, alignment: .trailing)
                    Text("$\(String(format: "%.2f", data.value))").frame(alignment: .trailing)
                }
            }
        }
    }
}





struct ExpenseSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSummaryView()
    }
}
