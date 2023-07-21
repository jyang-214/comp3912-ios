//
//  ExpenseListViewController.swift
//  Income & Expense Tracker
//
//  Created by Jacky Yang on 2023-07-07.
//

import Foundation

import UIKit

class ExpenseListViewController: UITableViewController, AddExpenseDelegate {
    
    var data = DataProvider.makeData()
    
    var navController: UINavigationController?
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationItem.title="Expense Tracker"
        
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonTapped() {
        // Perform the action when the button is tapped
        // For example, show an add expense screen or perform some other action
        print("Add button has been clicked")
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
            location: cellData.location
            
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
        
        guard let expenseDate = dateFormatter.date(from: expense.date) else {
            // If the date cannot be converted to a valid Date object, do not add the expense.
            return
        }
        
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
        
        tableView.reloadData()
    }


    
    
    
    
    
}
