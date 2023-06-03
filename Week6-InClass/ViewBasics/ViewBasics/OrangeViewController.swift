//
//  OrangeViewController.swift
//  ViewBasics
//
//  Created by Jacky Yang on 2023-06-03.
//

import Foundation
import UIKit


class OrangeViewController:UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title="Orange View"
        view.backgroundColor = .orange
        
        let leftButton = UIBarButtonItem(title: "Left Close", style: .plain, target: self, action: #selector(leftButtonTapped))
        let rightButton = UIBarButtonItem(title: "Right Close", style: .plain, target: self, action: #selector(rightButtonTapped))

        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func leftButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func rightButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }

}
