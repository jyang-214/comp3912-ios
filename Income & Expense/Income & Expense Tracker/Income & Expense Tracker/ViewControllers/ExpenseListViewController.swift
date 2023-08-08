//
//  ExpenseListViewController.swift
//  Income & Expense Tracker
//
//  Created by Jacky Yang on 2023-07-07.
//

import Foundation

import UIKit

import SwiftUI

class ExpenseListViewController: UITableViewController, AddExpenseDelegate {
    
    var data: [(String, [Expense])] = []
    var navController: UINavigationController?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationItem.title="Expense Tracker"
        
        // Create a UIBarButtonItem with the system-defined menu icon
            let menuBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(menuButtonTapped))
            
            // Set the menu button as the left bar button item
            self.navigationItem.leftBarButtonItem = menuBarButtonItem
            
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func menuButtonTapped() {
        // Handle the menu button tap event
        // For example, show a side menu or perform any other action you want
        print("hamburger menu button pressed")
        let sidebarMenuView = SidebarMenuView()
                let hostingController = UIHostingController(rootView: sidebarMenuView)
                present(hostingController, animated: true, completion: nil)
    }
    
    @objc func addButtonTapped() {
        // Perform the action when the button is tapped
        // For example, show an add expense screen or perform some other action
        //        print("Add button has been clicked")
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
        //        let navController = storyboard.instantiateViewController(withIdentifier: "AddExpenseNavigationControllerID") as! UINavigationController
        let addExpenseVC = storyboard.instantiateViewController(withIdentifier: "AddExpenseNavigationControllerID") as! UINavigationController
        // Set the delegate of AddExpenseViewController to ExpenseListViewController
        if let addExpenseViewController = addExpenseVC.viewControllers.first as? AddExpenseViewController {
            addExpenseViewController.delegate = self
        }
        
        // Store the navigation controller to use it later
        navController = addExpenseVC
        
        //        self.present(navController, animated: true, completion: nil)
        self.present(addExpenseVC, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        //registration of the ExpenseCell which is a UITableViewCell
        tableView.register(ExpenseCell.self, forCellReuseIdentifier: "cell")
        // Load previously saved data from the file
        data = ExpensePersistenceManager.loadData()
        tableView.reloadData()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionData = data[section]
        return sectionData.1.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExpenseCell
        
        let cellData = data[indexPath.section].1[indexPath.row]
        
        cell.updateView(
            expenseName: cellData.expenseName,
            dollarAmount: cellData.dollarAmount,
            category: cellData.category
        )
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellData = data[indexPath.section].1[indexPath.row]
        
        let expenseDetailsVC = ExpenseDetailsViewController()
        expenseDetailsVC.expenseData = cellData // Pass the selected expense data to the new view controller
        
        // Wrap the `ExpenseDetailsViewController` in a `UINavigationController`
        let navigationController = UINavigationController(rootViewController: expenseDetailsVC)
        
        // Set the presentation style to `.formSheet` for the navigation controller
        navigationController.modalPresentationStyle = .formSheet
        
        // Present the `UINavigationController` modally
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func didAddExpense(_ expense: Expense) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        
        if let existingSectionIndex = data.firstIndex(where: { $0.0 == expense.date }) {
            // If a section with the same date already exists, append the expense to that section
            data[existingSectionIndex].1.append(expense)
            
            // Sort the expense array in the section from newest to oldest
            data[existingSectionIndex].1.sort(by: { $0.date > $1.date })
        } else {
            // Otherwise, create a new section with the expense date
            data.append((expense.date, [expense]))
        }
        
        // Sort the data array based on the section dates from newest to oldest
        data.sort(by: { dateFormatter.date(from: $0.0)! > dateFormatter.date(from: $1.0)! })
        
        // Save the updated data to the file whenever a new expense is added
        ExpensePersistenceManager.saveData(data)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let sectionData = data[indexPath.section]
            var expensesInSection = sectionData.1
            expensesInSection.remove(at: indexPath.row)
            
            if expensesInSection.isEmpty {
                data.remove(at: indexPath.section)
                tableView.deleteSections([indexPath.section], with: .fade) // Update section count
            } else {
                data[indexPath.section].1 = expensesInSection
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            ExpensePersistenceManager.saveData(data)
        }
    }


}
