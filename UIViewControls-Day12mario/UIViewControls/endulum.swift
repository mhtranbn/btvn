//
//  endulum.swift
//  UIViewControls
//
//  Created by mhtran on 10/1/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class endulum: UIViewController {

    var endulum1: UIImageView?
    var slider: UISlider?
    var _angle, _angleDelta : Double?
    var timer: NSTimer?
    let maxEngle = M_2_PI
    
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        endulum1 = UIImageView(frame: CGRect(x: self.view.bounds.size.width * 0.5 - 10, y: self.view.bounds.size.height * 0.25, width: 30, height: 200))
        endulum1?.image = UIImage(named: "pendulum.png")
        self.endulum1?.layer.anchorPoint = CGPointMake(0.5, 0)
        self.view.addSubview(endulum1!)

        slider = UISlider(frame: CGRect(x: 70, y: 40, width: 200, height: 40))
        slider?.addTarget(self, action: "sliderChangeMode:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(slider!)
        
        let airPlaneMode = UISwitch(frame: CGRect(x: 10, y: 45, width: self.view.bounds.size.width - 50, height: 40))
        self.view.center = CGPoint(x: 200, y: 200)
        airPlaneMode.addTarget(self, action: "airPlaneChangeMode:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(airPlaneMode)
     }
    
    func airPlaneChangeMode (switchbutton: UISwitch) {
        if switchbutton.on {
            startAnimation()
            //self.slider?.value = 1
        }
        else {
            timer?.invalidate()
            timer = nil
            
        }
        
    }
    
    func sliderChangeMode (slider : UISlider) {
        self.endulum1?.transform = CGAffineTransformMakeRotation(CGFloat(maxEngle * Double(2 * slider.value - 1)))
        //Float(_angle!) = self.slider?.value
        
    }
    
    func startAnimation () {
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "runEndulum1", userInfo: nil, repeats: true)
    
    }
    
    func runEndulum1() {
        _angle! = _angleDelta! + _angle!
        if (_angle > maxEngle) | (_angle < -(maxEngle)) {
            _angleDelta! = -(_angleDelta!)
        }
        self.endulum1?.transform = CGAffineTransformMakeRotation(CGFloat(_angle!))
        self.slider?.value = Float(_angle!) / (Float(maxEngle) * 2 ) + 0.5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _angle = 0.0
        _angleDelta = 0.05
        
    }

    
}
