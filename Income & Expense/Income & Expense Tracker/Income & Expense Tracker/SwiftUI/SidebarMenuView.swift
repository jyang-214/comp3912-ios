//
//  SidebarMenu.swift
//  Income & Expense Tracker
//
//  Created by Jacky Yang on 2023-08-07.
//

import SwiftUI

struct SidebarMenuView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                
                Text("Menu")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .padding(.bottom)
                NavigationLink("Expense Summary") {
                    ExpenseSummaryView()
                }
                .padding(.bottom, 10)
                NavigationLink("Budgets") {
                    BudgetsSettingView()
                }
                .padding(.bottom, 10)
                NavigationLink("Export Data") {
                    ExportView()
                }
                .padding(.bottom, 10)
                NavigationLink("Import Data") {
                    ImportView()
                }
                .padding(.bottom, 10)
                Spacer()
            }
            .navigationBarHidden(true)
            .padding(.top, 50)
            .background(Color.white)
        }
        .listStyle(SidebarListStyle())
    }
}

struct SidebarMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarMenuView()
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName("Sidebar Menu")
    }
}




