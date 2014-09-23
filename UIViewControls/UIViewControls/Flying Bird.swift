//
//  Flying Bird.swift
//  UIViewControls
//
//  Created by mhtran on 9/23/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class Flying_Bird: UIViewController , UITextFieldDelegate {

    var bird, biendong : UIImageView?
    var slider : UISlider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.FlyBird()
     
        
    }

    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
//        let airplaneMode = UISwitch()
//        airplaneMode.center = CGPoint(x: 280, y: 500)
//        airplaneMode.addTarget(self, action: "airplaneModeChange", forControlEvents: UIControlEvents.ValueChanged)
//        self.view.addSubview(airplaneMode)
        bird = UIImageView(frame: CGRect(x: 10 , y: 440, width: 100, height: 100))
        biendong = UIImageView(frame: CGRect(x: 0, y: 10, width: 320, height: 200))
        //bird!.image = UIImage(named: "V_t_c_p.jpg")
        bird!.image = UIImage(named: "bocau.jpeg")
        biendong!.image = UIImage(named: "biendong.jpg")
        //self.bird!.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))

        UIView.animateWithDuration(2, delay: 3, options: .Repeat, animations: {
            self.bird!.center = CGPoint(x: 400,y: 0)
        self.bird!.alpha = 0
        }, completion: {finished in})
        
        self.view.addSubview(biendong!)
        self.view.addSubview(bird!)
        
    }
    
//    func airplaneModeChange(switchButton: UISwitch) {
//        if switchButton.on {
//            UIView.animateWithDuration(2, delay: 3, options: .Repeat, animations: {
//                self.bird!.center = CGPoint(x: 400,y: 0)
//                self.bird!.alpha = 0
//                }, completion: {finished in})
//            self.view.addSubview(biendong!)
//            self.view.addSubview(bird!)
//        }    }
}
