//
//  HomeViewController.swift
//  ViewBasics
//
//  Created by Jacky Yang on 2023-05-27.
//

import UIKit

class HomeViewController: UIViewController {

    var tagViews: [Int: UIView] = [:]
    
    // method for life cycle of a view controller
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .red;
        
        view.tag = 1000
        var tag = 1001
        var margin = 0
        
        for i in Range(0...10){
            
            margin = margin + 40
            
            let frame = view?.frame
            
            let thisView = UIView(frame: CGRect(x: margin,
                                                y: margin,
                                                width: Int(frame!.size.width-CGFloat(margin)),
                                                height: Int(frame!.size.height-CGFloat(margin))))
            
            thisView.tag = tag
            tagViews[tag] = thisView
            tag += 1
            thisView.isUserInteractionEnabled = true
            
            let red = Float.random(in: 0...255)/255.0
            let green = Float.random(in: 0...255)/255.0
            let blue = Float.random(in: 0...255)/255.0
            
            let alpha = Float.random(in: 0.5...1.0)
            
            let color = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
            thisView.backgroundColor = color
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.2){self.view?.addSubview(thisView)}
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
}

