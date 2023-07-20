//
//  ExpenseDetailsViewController.swift
//  Income & Expense Tracker
//
//  Created by Jacky Yang on 2023-07-19.
//
import Foundation

import UIKit

class ExpenseDetailsViewController: UIViewController {
    var expenseData: Expense? // Create a property to hold the selected expense data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupLabels()
        addCloseButtonToNavigationBar() // Add the custom "Close" button to the navigation bar
        title = expenseData?.expenseName
    }
    
    private func setupLabels() {
        let nameTextLabel = UILabel()
        let nameLabel = UILabel()
        let locationTextLabel = UILabel()
        let locationLabel = UILabel()
        let amountTextLabel = UILabel()
        let amountLabel = UILabel()
        let categoryTextLabel = UILabel()
        let categoryLabel = UILabel()
        
        // Customize label properties
        nameTextLabel.textColor = .black
        nameLabel.textColor = .black
        nameLabel.textAlignment = .left // Align the text to the left
        nameLabel.numberOfLines = 0 // Allow multiple lines
        
        locationTextLabel.textColor = .black
        locationLabel.textColor = .black
        locationLabel.textAlignment = .left // Align the text to the left
        locationLabel.numberOfLines = 0 // Allow multiple lines

        amountTextLabel.textColor = .black
        amountLabel.textColor = .black
        amountLabel.textAlignment = .left // Align the text to the left
        amountLabel.numberOfLines = 0 // Allow multiple lines

        categoryTextLabel.textColor = .black
        categoryLabel.textColor = .black
        categoryLabel.textAlignment = .left // Align the text to the left
        categoryLabel.numberOfLines = 0 // Allow multiple lines

        if let expense = expenseData {
            // Set label text from expenseData
            nameTextLabel.text = "Transaction Name: "
            nameLabel.text = expense.expenseName
            
            locationTextLabel.text = "Location: "
            locationLabel.text = expense.location
            
            amountTextLabel.text = "Amount: "
            amountLabel.text = "$\(String(format: "%.2f", expense.dollarAmount))"
            
            categoryTextLabel.text = "Category: "
            categoryLabel.text = expense.category
        }
        
        // Set a fixed width for the text labels to make them align properly
        nameTextLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        locationTextLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        amountTextLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        categoryTextLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        // Add labels to the view
        let nameStackView = UIStackView(arrangedSubviews: [nameTextLabel, nameLabel])
        nameStackView.axis = .horizontal
        nameStackView.spacing = 8
        
        let locationStackView = UIStackView(arrangedSubviews: [locationTextLabel, locationLabel])
        locationStackView.axis = .horizontal
        locationStackView.spacing = 8
        
        let amountStackView = UIStackView(arrangedSubviews: [amountTextLabel, amountLabel])
        amountStackView.axis = .horizontal
        amountStackView.spacing = 8
        
        let categoryStackView = UIStackView(arrangedSubviews: [categoryTextLabel, categoryLabel])
        categoryStackView.axis = .horizontal
        categoryStackView.spacing = 8
        
        let stackView = UIStackView(arrangedSubviews: [nameStackView, locationStackView, amountStackView, categoryStackView])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    
    
    private func addCloseButtonToNavigationBar() {
        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeButtonTapped))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

