//
//  ExpenseCell.swift
//  Income & Expense Tracker
//
//  Created by Jacky Yang on 2023-07-07.
//

import Foundation

import UIKit

class ExpenseCell: UITableViewCell {
    
    lazy var expenseNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = UIColor(named: "#9F9EA5")
        return label
    }()
    
    lazy var dollarAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = UIColor(named: "#9F9EA5")
        return label
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = UIColor(named: "#9F9EA5")
        return label
    }()
    
    
    lazy var labelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.addArrangedSubview(expenseNameLabel)
        stack.addArrangedSubview(locationLabel)
        stack.addArrangedSubview(categoryLabel)
        stack.alignment = .leading
        return stack
    }()
    
    lazy var leftStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 0
        //        stack.addArrangedSubview(avatarView)
        stack.addArrangedSubview(labelStack)
        stack.alignment = .center
        return stack
    }()
    
    lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(leftStack)
        stack.addArrangedSubview(dollarAmountLabel)
        stack.spacing = 0
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return stack
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        contentView.addSubview(contentStack)
        NSLayoutConstraint.activate([
            contentStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
    }
    
    func updateView(expenseName: String, dollarAmount: Double, category: String) {
        expenseNameLabel.text = expenseName
        dollarAmountLabel.text = "$\(String(format: "%.2f", dollarAmount))"
        categoryLabel.text = category
    }
    
}
