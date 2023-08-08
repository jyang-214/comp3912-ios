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
        
        let dateTextLabel = UILabel()
        let dateLabel = UILabel()
        
        let typeTextLabel = UILabel()
        let typeLabel = UILabel()
        
        let categoryTextLabel = UILabel()
        let categoryLabel = UILabel()

        
        let amountTextLabel = UILabel()
        let amountLabel = UILabel()
        
        let paymentTypeTextLabel = UILabel()
        let paymentTypeLabel = UILabel()
        
        let descriptionTextLabel = UILabel()
        let descriptionLabel = UILabel()
        
        // Customize label properties
        nameTextLabel.textColor = .black
        nameLabel.textColor = .black
        nameLabel.textAlignment = .left // Align the text to the left
        nameLabel.numberOfLines = 0 // Allow multiple lines
        
        dateTextLabel.textColor = .black
        dateLabel.textColor = .black
        dateLabel.textAlignment = .left // Align the text to the left
        dateLabel.numberOfLines = 0 // Allow multiple lines
        
        typeTextLabel.textColor = .black
        typeLabel.textColor = .black
        typeLabel.textAlignment = .left // Align the text to the left
        typeLabel.numberOfLines = 0 // Allow multiple lines
        
        categoryTextLabel.textColor = .black
        categoryLabel.textColor = .black
        categoryLabel.textAlignment = .left // Align the text to the left
        categoryLabel.numberOfLines = 0 // Allow multiple lines

        amountTextLabel.textColor = .black
        amountLabel.textColor = .black
        amountLabel.textAlignment = .left // Align the text to the left
        amountLabel.numberOfLines = 0 // Allow multiple lines
        
        paymentTypeTextLabel.textColor = .black
        paymentTypeLabel.textColor = .black
        paymentTypeLabel.textAlignment = .left // Align the text to the left
        paymentTypeLabel.numberOfLines = 0 // Allow multiple lines
        
        descriptionTextLabel.textColor = .black
        descriptionLabel.textColor = .black
        descriptionLabel.textAlignment = .left // Align the text to the left
        descriptionLabel.numberOfLines = 0 // Allow multiple lines

        if let expense = expenseData {
            // Set label text from expenseData
            nameTextLabel.text = "Transaction Name: "
            nameLabel.text = expense.expenseName
            
            dateTextLabel.text = "Transaction Date: "
            dateLabel.text = expense.date
            
            typeTextLabel.text = "Transaction Type: "
            typeLabel.text = expense.expenseType
            
            categoryTextLabel.text = "Category: "
            categoryLabel.text = expense.category
            
            amountTextLabel.text = "Amount: "
            amountLabel.text = "$\(String(format: "%.2f", expense.dollarAmount))"
            
            paymentTypeTextLabel.text = "Payment Type: "
            paymentTypeLabel.text = expense.paymentType
            
            descriptionTextLabel.text = "Description: "
            descriptionLabel.text = expense.description
        }
        
        // Set a fixed width for the text labels to make them align properly
        nameTextLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        dateTextLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        typeTextLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        categoryTextLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        amountTextLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        paymentTypeTextLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        descriptionTextLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        // Add labels to the view
        let nameStackView = UIStackView(arrangedSubviews: [nameTextLabel, nameLabel])
        nameStackView.axis = .horizontal
        nameStackView.spacing = 8
        
        let dateStackView = UIStackView(arrangedSubviews: [dateTextLabel, dateLabel])
        dateStackView.axis = .horizontal
        dateStackView.spacing = 8
        
        let typeStackView = UIStackView(arrangedSubviews: [typeTextLabel, typeLabel])
        typeStackView.axis = .horizontal
        typeStackView.spacing = 8
        
        let categoryStackView = UIStackView(arrangedSubviews: [categoryTextLabel, categoryLabel])
        categoryStackView.axis = .horizontal
        categoryStackView.spacing = 8
        
        let amountStackView = UIStackView(arrangedSubviews: [amountTextLabel, amountLabel])
        amountStackView.axis = .horizontal
        amountStackView.spacing = 8
        
        let paymentTypeStackView = UIStackView(arrangedSubviews: [paymentTypeTextLabel, paymentTypeLabel])
        paymentTypeStackView.axis = .horizontal
        paymentTypeStackView.spacing = 8
        
        let descriptionStackView = UIStackView(arrangedSubviews: [descriptionTextLabel, descriptionLabel])
        descriptionStackView.axis = .horizontal
        descriptionStackView.spacing = 8
        
        let stackView = UIStackView(arrangedSubviews: [nameStackView, dateStackView, typeStackView, categoryStackView, amountStackView, paymentTypeStackView, descriptionStackView ])
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
        let closeButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(closeButtonTapped))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

