//
//  test slider.swift
//  UIViewControls
//
//  Created by mhtran on 10/2/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class test_slider: UIViewController {
    var slider: UISlider?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        let airplaneMode = UISwitch()
        airplaneMode.center = CGPoint(x: 150, y: 150)
        airplaneMode.addTarget(self, action: "airplaneModeChange:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(airplaneMode)
        slider = UISlider(frame: CGRect(x: 10, y: 200, width: 200, height: 40))
        slider!.addTarget(self, action: "onSliderChange:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(slider!)

    }
    func airplaneModeChange(switchButton: UISwitch) {
           }
    
    func onSliderChange (slider : UISlider) {
        //        self.endulum1?.transform = CGAffineTransformMakeRotation(CGFloat(maxEngle * Double(slider.value)))
        
    }
}

