//
//  AddExpenseViewController.swift
//  Income & Expense Tracker
//
//  Created by Jacky Yang on 2023-07-07.
//
import Foundation
import UIKit


class AddExpenseViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var transactionTypeDropdownButton: UIButton!
    @IBOutlet weak var transactionTypeDropdownPickerView: UIPickerView!
    @IBOutlet weak var categoryDropdownButton: UIButton!
    @IBOutlet weak var categoryDropdownPickerView: UIPickerView!
    @IBOutlet weak var paymentTypeDropdownButton: UIButton!
    @IBOutlet weak var paymentTypeDropdownPickerView: UIPickerView!
    @IBOutlet weak var dollarAmountTextField: UITextField!
    @IBOutlet weak var transactionDescriptionTextField: UITextField!
    @IBOutlet weak var transactionNameTextField: UITextField!
    
    weak var delegate: AddExpenseDelegate?
    
    
    let transactionTypes = ["Expense", "Income"]
    let categories = ["Grocery", "Restaurants", "Gas", "Entertainment", "Recurring Bills" ,"Others"]
    let paymentTypes = ["Cash", "Credit Card", "Debit Card"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Transaction"
        
        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeButtonTapped))
        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonTapped))
        
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.rightBarButtonItem = addButton
        
        transactionNameTextField.layer.borderWidth = 1.0
        transactionNameTextField.layer.borderColor = UIColor.black.cgColor
        transactionNameTextField.layer.cornerRadius = 8.0
        transactionNameTextField.textAlignment = .left
        transactionNameTextField.contentVerticalAlignment = .top
        transactionNameTextField.delegate = self
        
        transactionTypeDropdownPickerView.dataSource = self
        transactionTypeDropdownPickerView.delegate = self
        transactionTypeDropdownPickerView.isHidden = true 
        
        categoryDropdownPickerView.dataSource = self
        categoryDropdownPickerView.delegate = self
        categoryDropdownPickerView.isHidden = true
        
        dollarAmountTextField.layer.borderWidth = 1.0
        dollarAmountTextField.layer.borderColor = UIColor.black.cgColor
        dollarAmountTextField.layer.cornerRadius = 8.0
        dollarAmountTextField.textAlignment = .left
        dollarAmountTextField.contentVerticalAlignment = .top
        dollarAmountTextField.delegate = self
        
        paymentTypeDropdownPickerView.dataSource = self
        paymentTypeDropdownPickerView.delegate = self
        paymentTypeDropdownPickerView.isHidden = true
        
        let transactionDescriptionPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        transactionDescriptionTextField.leftView = transactionDescriptionPaddingView
        transactionDescriptionTextField.leftViewMode = .always
        transactionDescriptionTextField.textAlignment = .left
        transactionDescriptionTextField.contentVerticalAlignment = .top
        transactionDescriptionTextField.layer.borderWidth = 1.0
        transactionDescriptionTextField.layer.borderColor = UIColor.black.cgColor
        transactionDescriptionTextField.layer.cornerRadius = 8.0
        transactionDescriptionTextField.delegate = self
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        setupDoneButton(for: transactionNameTextField)
        setupDoneButton(for: dollarAmountTextField)
        setupDoneButton(for: transactionDescriptionTextField)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setupDoneButton(for textField: UITextField) {
        let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: 44)))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.items = [flexibleSpace, doneButton]
        textField.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonTapped() {
        view.endEditing(true)
    }
    
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == transactionTypeDropdownPickerView {
            return transactionTypes.count
        }
        else if pickerView == categoryDropdownPickerView {
            return categories.count
        } else if pickerView == paymentTypeDropdownPickerView {
            return paymentTypes.count
        } else {
            return 0
        }    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == transactionTypeDropdownPickerView {
            return transactionTypes[row]
        } else if pickerView == categoryDropdownPickerView {
            return categories[row]
        } else if pickerView == paymentTypeDropdownPickerView {
            return paymentTypes[row]
        } else {
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == transactionTypeDropdownPickerView {
            let selectedTransactionType = transactionTypes[row]
            transactionTypeDropdownButton.setTitle(selectedTransactionType, for: .normal)
            transactionTypeDropdownPickerView.isHidden = true
        } else if pickerView == categoryDropdownPickerView {
            let selectedCategory = categories[row]
            categoryDropdownButton.setTitle(selectedCategory, for: .normal)
            categoryDropdownPickerView.isHidden = true
        } else if pickerView == paymentTypeDropdownPickerView {
            let selectedPaymentType = paymentTypes[row]
            paymentTypeDropdownButton.setTitle(selectedPaymentType, for: .normal)
            paymentTypeDropdownPickerView.isHidden = true
        }
    }
    
    
    
    // MARK: - Button Action
    
    @IBAction func transactionTypeDropdownButtonTapped(_ sender: UIButton) {
        transactionTypeDropdownPickerView.isHidden = !transactionTypeDropdownPickerView.isHidden
        print("Select Type button is clicked")
    }
    
    @IBAction func categoryDropdownButtonTapped(_ sender: UIButton) {
        categoryDropdownPickerView.isHidden = !categoryDropdownPickerView.isHidden
    }
    
    @IBAction func paymentTypeDropdownButtonTapped(_ sender: UIButton) {
        paymentTypeDropdownPickerView.isHidden = !paymentTypeDropdownPickerView.isHidden
    }
    
    // MARK: - Close and Add Button Actions
    
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addButtonTapped() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        
        let selectedDate = datePicker.date
        
        let formattedDate = dateFormatter.string(from: selectedDate)
        
        guard let selectedTransactionType = transactionTypeDropdownButton.title(for: .normal) else {
            return
        }
        
        guard let selectedPaymentType = paymentTypeDropdownButton.title(for: .normal) else {
            return
        }
        
        let expense = Expense(
            expenseName: transactionNameTextField.text ?? "",
            date: formattedDate,
            expenseType: selectedTransactionType,
            category: categoryDropdownButton.title(for: .normal) ?? "",
            dollarAmount: Double(dollarAmountTextField.text ?? "0") ?? 0.0,
            paymentType: selectedPaymentType,
            description: transactionDescriptionTextField.text ?? ""
        )
        
        delegate?.didAddExpense(expense)
        self.dismiss(animated: true, completion: nil)
    }
}

protocol AddExpenseDelegate: AnyObject {
    func didAddExpense(_ expense: Expense)
}
