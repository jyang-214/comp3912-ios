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
    @IBSegueAction func ToImageViewController(_ coder: NSCoder) -> ImageViewController? {
        guard let vc = ImageViewController(coder: coder) else {
            return nil
        }
        vc.tintColor = viewBackgroundColor
        return vc
        
    }
}
