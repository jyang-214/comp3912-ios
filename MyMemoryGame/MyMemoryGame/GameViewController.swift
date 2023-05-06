//
//  ViewController.swift
//  MyMemoryGame
//
//  Created by Jacky Yang on 2023-05-06.
//

import UIKit

class GameViewController: UIViewController {

    var counter = 1
    var tag1: Int?
    var tag2: Int?
    var imageMap:[Int:String] = [:]
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var pointLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var countdown: UILabel!
    
    @IBAction func start(_ sender: Any) {
//        counter+=1
//        countdown.text = String(counter) + "s"
//        print(String(counter) + "s")
        let _ = imageMap.keys.enumerated().map {(self.view.viewWithTag($1) as? UIImageView)?.startAnimating()}
                //startCountdown()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countdown.isHidden = true
        
        let _ = view.subviews.filter { $0 is UIImageView
        }.enumerated().map {
            $1.tag = $0+1000
            $1.tintColor = .lightGray
        }
        
        startButton.layer.cornerRadius = 10
        startButton.clipsToBounds = true
        setupTheGame(4.0)
    }

    func setupTheGame(_ duration: Double){
        
        var set = Set(0...11)
        let _ = view.subviews.filter {$0.tag>=1000}.enumerated().map {
            if let random = set.randomElement(){
                
                let imgName = "avatar\((random%6)+1)"
                set.remove(random)
                let actualImage = UIImage(named: imgName)
                imageMap[$1.tag]=imgName
                
                ($1 as? UIImageView)?.animationImages = [actualImage!]
                ($1 as? UIImageView)?.animationDuration = duration // Set the duration of the animation in seconds
                ($1 as? UIImageView)?.animationRepeatCount = 1
                
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
                $1.isUserInteractionEnabled = true // Enable user interaction for the image view
                $1.addGestureRecognizer(tapGestureRecognizer)
                $1.tintColor = .lightGray
            }
        }
    }
    
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer){
            guard let tappedView = sender.view else { return }
            
            
            if(tag1==nil){
                tag1 = tappedView.tag
                (tappedView as? UIImageView)?.image = UIImage(named: imageMap[tag1!]!)
            } else if(tag2==nil){
                tag2 = tappedView.tag
                (tappedView as? UIImageView)?.image = UIImage(named: imageMap[tag2!]!)
            }
            
//            judge(tag1, tag2)
            
        }
}

