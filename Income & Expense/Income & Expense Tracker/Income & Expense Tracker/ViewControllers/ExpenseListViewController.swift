//
//  ExpenseListViewController.swift
//  Income & Expense Tracker
//
//  Created by Jacky Yang on 2023-07-07.
//

import Foundation

import UIKit

class ExpenseListViewController: UITableViewController {
    
    let data = DataProvider.makeData()
    
    
    
    
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
        let navController = storyboard.instantiateViewController(withIdentifier: "AddExpenseNavigationControllerID") as! UINavigationController
        
        
        self.present(navController, animated: true, completion: nil)
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



    
}
