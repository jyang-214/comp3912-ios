import Foundation
import UIKit

class AddExpenseViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
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
    
    let transactionTypes = ["Expense", "Income", "Investment"] // Replace with your transaction types
    let categories = ["Food", "Transportation", "Entertainment", "Shopping", "Others"]
    let paymentTypes = ["Cash", "Credit Card", "Debit Card", "Online Payment"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Transaction"
        
        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeButtonTapped))
        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonTapped))
        
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.rightBarButtonItem = addButton
        
        // Set up the picker view
        transactionTypeDropdownPickerView.dataSource = self
        transactionTypeDropdownPickerView.delegate = self
        transactionTypeDropdownPickerView.isHidden = true // Hide the picker view initially
        
        categoryDropdownPickerView.dataSource = self
        categoryDropdownPickerView.delegate = self
        categoryDropdownPickerView.isHidden = true
        
        paymentTypeDropdownPickerView.dataSource = self
        paymentTypeDropdownPickerView.delegate = self
        paymentTypeDropdownPickerView.isHidden = true
        
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
        if let name = transactionNameTextField.text {
            print(name)
        }
        
        // Save the selected date value from the date picker
        let selectedDate = datePicker.date
        print(selectedDate)
        
        // Get the selected transaction type from the button title
        guard let selectedTransactionType = transactionTypeDropdownButton.title(for: .normal) else {
            // Handle if no transaction type is selected
            return
        }
        print(selectedTransactionType)
        
        guard let selectedCategory = categoryDropdownButton.title(for: .normal) else {
            // Handle if no transaction type is selected
            return
        }
        print(selectedCategory)
        
        guard let selectedPaymentType = paymentTypeDropdownButton.title(for: .normal) else {
            // Handle if no transaction type is selected
            return
        }
        print(selectedPaymentType)
        
        if let dollarAmount = dollarAmountTextField.text {
            print(dollarAmount)
        }
        
        if let description = transactionDescriptionTextField.text {
            print(description)
        }
        self.dismiss(animated: true, completion: nil)
    }
}
