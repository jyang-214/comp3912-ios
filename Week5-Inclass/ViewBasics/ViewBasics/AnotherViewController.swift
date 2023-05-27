//
//  AnotherViewController.swift
//  ViewBasics
//
//  Created by Jacky Yang on 2023-05-27.
//

import Foundation
import UIKit

class AnotherViewController:UIViewController{
    
    var viewBackgroundColor: UIColor!=nil
    
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewBackgroundColor

    }
}
