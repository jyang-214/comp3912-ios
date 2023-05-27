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
//            thisView.isMultipleTouchEnabled = true      // if your app supports multiple touches
            
            let red = Float.random(in: 0...255)/255.0
            let green = Float.random(in: 0...255)/255.0
            let blue = Float.random(in: 0...255)/255.0
            
//            let alpha = Float.random(in: 0.5...1.0)
            let alpha = 1

            
            let color = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
            thisView.backgroundColor = color
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.2){self.view?.addSubview(thisView)}
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch Moved")
        super.touchesMoved(touches, with: event)
        
        let touch = touches.first!
        let location = touch.location(in: view)
        
        print("touchesMoved \(location)")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch Cancelled")
        super.touchesCancelled(touches, with: event)
        
        let touch = touches.first!
        let location = touch.location(in: view)
        
        print("touchesCancelled \(location)")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch Began")
        super.touchesBegan(touches, with: event)
        
        let touch = touches.first!
        let location = touch.location(in: view)
        
        print("touchesBegan \(location)")

        //Location within a specific subview
        if let view = tagViews[touch.view?.tag ?? 0]{
            print("Begin tag: \(view.tag)")
//            view.backgroundColor = .lightGray
            
            if touch.view==view {
            let location = touch.location(in: view)
                print("Location in Subview: \(location)")
            }

        //Transition to ColorViewController
        transitionToColorViewController(from: view)
                }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch Ended")
        super.touchesEnded(touches, with: event)
        
        let touch = touches.first!
        let location = touch.location(in: view)
        
        print("touchesEnded \(location)")
    }
    
    func transitionToColorViewController(from view: UIView){
        if view.tag%2==0 {
            //transition to a viewController that is not on storyboard
            print("Transition to : \(view.tag)")
            let vc = ColorViewController()
            
            vc.viewBackgroundColor=view.backgroundColor
            
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .coverVertical
            present(vc, animated: true, completion: nil)
        }
        else{
            //transition to a viewcontroller that is on storyboard
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "imagecontroller")
                    as? AnotherViewController else{
                return
            }
            
            vc.viewBackgroundColor=view.backgroundColor
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .coverVertical
            present(vc, animated: true, completion: nil)
        }
    }
}

