//
//  ImportView.swift
//  Income & Expense Tracker
//
//  Created by Jacky Yang on 2023-08-08.
//

import SwiftUI
import Foundation

struct ImportView: View {
    @State private var isDocumentPickerPresented = false
    @State private var importedData: [String: Any]? = nil
    @State private var showAlert = false

    var body: some View {
        VStack {
            if let importedData = importedData {
                Text("Imported Data:")
                    .padding()
                // Display the imported data here
            }

            Button("Import Data") {
                isDocumentPickerPresented = true
            }
            .fileImporter(isPresented: $isDocumentPickerPresented, allowedContentTypes: [.json]) { result in
                do {
                    let fileURL = try result.get()

                    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                    let destinationURL = documentsURL.appendingPathComponent(fileURL.lastPathComponent)

                    // Remove the existing file if it already exists
                    if FileManager.default.fileExists(atPath: destinationURL.path) {
                        try FileManager.default.removeItem(at: destinationURL)
                    }

                    // Start accessing the security-scoped resource
                    if fileURL.startAccessingSecurityScopedResource() {
                        defer {
                            fileURL.stopAccessingSecurityScopedResource()
                        }

                        try FileManager.default.copyItem(at: fileURL, to: destinationURL)

                        let data = try Data(contentsOf: destinationURL)
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        importedData = json
                        showAlert = true
                    }
                } catch {
                    print("Error importing and copying data: \(error)")
                }
            }
            .padding()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Import Completed"),
                message: Text("The file has been imported and copied.\nPlease restart the application!"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
