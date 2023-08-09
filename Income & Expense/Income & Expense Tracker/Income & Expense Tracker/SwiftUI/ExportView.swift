//
//  ExportView.swift
//  Income & Expense Tracker
//
//  Created by Jacky Yang on 2023-08-08.
//

import SwiftUI

struct ExportView: View {
    @State private var isShareSheetPresented = false
    
    var body: some View {
        Button("Export Data") {
            if let fileURL = getExpenseFileURL() {
                isShareSheetPresented = true
            }
        }
        .sheet(isPresented: $isShareSheetPresented) {
            if let fileURL = getExpenseFileURL() {
                ActivityView(activityItems: [fileURL])
            }
        }
    }
    
    func getExpenseFileURL() -> URL? {
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return documentsDirectory.appendingPathComponent("expense_data.json")
        }
        return nil
    }
}

struct ActivityView: UIViewControllerRepresentable {
    var activityItems: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}





