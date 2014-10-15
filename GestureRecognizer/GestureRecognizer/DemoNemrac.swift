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
    var delTa : Double = 0.0001
    var width: Double = 0.0
    var height: Double = 0.0
    var miengThung: Bool?
    
    override func loadView() {
        super.loadView()
        var size = self.view.bounds.size
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        miengThung = false
        sot = UIImageView(frame: CGRect(x: size.width - 150, y: size.height - 200, width: 100, height: 100))
        sot?.image = UIImage(named: "bin.png")
        self.view.addSubview(sot!)
        rac = UIImageView(frame: CGRect(x: 20, y: 30, width: 40, height: 40))
        rac?.image = UIImage(named: "giay.png")
        self.view.addSubview(rac!)
        width = Double(size.width - 15)
        height = Double(size.height - 15)
        rac!.multipleTouchEnabled = true
        rac!.userInteractionEnabled = true
        
        let pan = UIPanGestureRecognizer(target: self, action: "onPan:")
        rac?.addGestureRecognizer(pan)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.016, target: self, selector: "loop:", userInfo: nil, repeats: true)
        
    }
    
    func onPan (pan: UIPanGestureRecognizer) {
        if (pan.state == UIGestureRecognizerState.Began || pan.state == UIGestureRecognizerState.Changed) {
            let veloccity = pan.velocityInView(self.view)
            vX += Double(veloccity.x) * 3 / width
            vY += Double(veloccity.y) * 3 / height
            vY += delTa * 9.8
        }
    }
    
    func loop (timer: NSTimer) {
        var size = self.view.bounds.size
        var x1 = Double(rac!.center.x) + vX
        var y1 = Double(rac!.center.y) + vY
        vX = 0.96 * vX
        rac!.center = CGPoint(x: x1, y: y1)
        //kiem tra toi mieng thung rac
        if (!miengThung!) {
            if ((y1 >= Double(self.view.bounds.size.height - 50)) && ((x1 >= Double(size.width - 250) && (x1 <= Double(size.width - 50))))) {
                
                NSLog("Vao Sot")
                vX = 0
                vY = 0
                stop()
            }
        } else {
            stop()
        }
    }
    
    
    func stop(){
        
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "reset:", userInfo: nil, repeats: false)
    }
    func reset(_timer: NSTimer?){
        
        rac!.center.x = 20
        rac!.center.y = 20
        //miengThung = false
        timer?.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "loop:", userInfo: nil, repeats: true)
    }
    
    
    
    
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
    
}
