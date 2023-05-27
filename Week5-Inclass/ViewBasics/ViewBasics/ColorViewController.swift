//
//  ColorViewController.swift
//  ViewBasics
//
//  Created by Jacky Yang on 2023-05-27.
//

import Foundation
import UIKit

class ColorViewController: UIViewController{
    
    var viewBackgroundColor: UIColor!=nil
    var subview: UIView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewBackgroundColor
        addView()
        addDismissButton()
        
    }
    
    func addView(){
        subview = UIView()
        subview.backgroundColor = .white
           
        subview.translatesAutoresizingMaskIntoConstraints=false
        subview.isUserInteractionEnabled=true
        
        view.addSubview(subview)
        
        NSLayoutConstraint.activate([
            subview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            subview.widthAnchor.constraint(equalToConstant: 200),
            subview.heightAnchor.constraint(equalToConstant: 200)
        ])
        
//        addTransitionButton(to: subview)
    }
    
    
    func addDismissButton(){
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(button)
        
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive=true
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive=true
        
        button.tintColor = .white
        button.setTitle("Done", for: .normal)
        button.addTarget(self, action: #selector(dismissCurrentViewController), for: .touchUpInside)
    }
    
    @objc func dismissCurrentViewController(){
        dismiss(animated: true, completion: nil)
    }
}
