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
    
    private var floatingButton: UIButton!
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationItem.title="Expense Tracker"
        
        
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
        
        let alertViewController = UIAlertController(title: cellData.expenseName, message: "You've selected this transaction", preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .cancel) { action in
            print("A transaction has been closed")
        }
        alertViewController.addAction(action)
        self.navigationController?.present(alertViewController, animated: true, completion: nil)
    }
    
}
