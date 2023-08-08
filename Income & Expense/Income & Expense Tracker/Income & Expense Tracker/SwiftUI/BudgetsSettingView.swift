//
//  DummyView.swift
//  Income & Expense Tracker
//
//  Created by Jacky Yang on 2023-08-07.
//

import SwiftUI
import Foundation
import UIKit

struct BudgetsSettingView: View {
    @State private var groceryAmount: String = ""
    @State private var restaurantAmount: String = ""
    @State private var gasAmount: String = ""
    @State private var entertainmentAmount: String = ""
    @State private var recurringBillsAmount: String = ""
    @State private var othersAmount: String = ""
    
    @State private var showAlert = false

    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Budgets")
                .font(.largeTitle)
                .bold()
            
            expenseRow(label: "Grocery", amount: $groceryAmount)
            expenseRow(label: "Restaurants", amount: $restaurantAmount)
            expenseRow(label: "Gas", amount: $gasAmount)
            expenseRow(label: "Entertainment", amount: $entertainmentAmount)
            expenseRow(label: "Recurring Bills", amount: $recurringBillsAmount)
            expenseRow(label: "Others", amount: $othersAmount)
            
            
            Button(action: {
                // Add your save functionality here
                saveBudgets()
            }) {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .onAppear {
            if let loadedBudget = Budget.loadFromJSONFile() {
                groceryAmount = loadedBudget.groceryAmount
                restaurantAmount = loadedBudget.restaurantAmount
                gasAmount = loadedBudget.gasAmount
                entertainmentAmount = loadedBudget.entertainmentAmount
                recurringBillsAmount = loadedBudget.recurringBillsAmount
                othersAmount = loadedBudget.othersAmount
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Budgets Saved"),
                  message: Text("Your budget amounts have been saved."),
                  dismissButton: .default(Text("OK")))
        }
        Spacer()

    }
    
    private func expenseRow(label: String, amount: Binding<String>) -> some View {
        HStack {
            Text(label)
                .foregroundColor(.blue)
                .bold()
                .frame(width: 120, alignment: .leading)
            TextField("Amount", text: amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    private func saveBudgets() {
        // Implement your logic here to save the budget amounts
        print("Budgets saved!")
        let budget = Budget(groceryAmount: groceryAmount,
                            restaurantAmount: restaurantAmount,
                            gasAmount: gasAmount,
                            entertainmentAmount: entertainmentAmount,
                            recurringBillsAmount: recurringBillsAmount,
                            othersAmount: othersAmount)
        
        do {
            let jsonData = try JSONEncoder().encode(budget)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    let fileURL = documentsDirectory.appendingPathComponent("budgets.json")
                    try jsonString.write(to: fileURL, atomically: true, encoding: .utf8)
                    print("Budgets saved to \(fileURL)")
                }
            }
        } catch {
            print("Error saving budgets: \(error)")
        }
        
        showAlert = true
    }
}

struct BudgetsSettingView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetsSettingView()
    }
}








