//
//  DemoNemrac.swift
//  GestureRecognizer
//
//  Created by mhtran on 10/11/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoNemrac: UIViewController {

    var rac, sot : UIImageView?
    var timer: NSTimer?
    var vX: Double = 0.0
    var vY: Double = 0.0
    var width: Double = 0.0
    var height: Double = 0.0
    
    override func loadView() {
        super.loadView()
        var center = self.view.bounds.size
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        rac = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        rac?.image = UIImage(named: "giay.png")
        self.view.addSubview(rac!)
        
        sot = UIImageView(frame: CGRect(x: center.width - 150, y: center.height - 200, width: 100, height: 100))
        sot?.image = UIImage(named: "bin.png")
        self.view.addSubview(sot!)
        width = Double(center.width - 15)
        height = Double(center.height - 15)
        rac!.multipleTouchEnabled = true
        rac!.userInteractionEnabled = true
        
        let pan = UIPanGestureRecognizer(target: self, action: "onPan:")
        rac?.addGestureRecognizer(pan)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.016, target: self, selector: "loop:", userInfo: nil, repeats: true)
        
    }
    
    func onPan (pan: UIPanGestureRecognizer) {
        if (pan.state == UIGestureRecognizerState.Began || pan.state == UIGestureRecognizerState.Changed) {
            let veloccity = pan.velocityInView(self.view)
            vX += Double(veloccity.x) * 5 / width
            vY += Double(veloccity.y) * 5 / height
        }
    }
    
    func loop (timer: NSTimer) {
        var x1 = Double(rac!.center.x) + vX
        var y1 = Double(rac!.center.y) + vY
        rac!.center = CGPoint(x: x1, y: y1)
        vX = 0.96 * vX
        vY = 0.96 * vY

    }
    
    
    
    
    
    
    
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
    
}
