//
//  DemoBia.swift
//  GestureRecognizer
//
//  Created by mhtran on 10/8/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit
import Darwin
import SpriteKit
class DemoBia: UIViewController {

    var ban1, gay1: UIImageView?
    var bi0 , bi6, bi8 , bi10, bi13 , bi15 : UIImageView?
    var timer: NSTimer?
    var vX: Double = 0.0
    var vY: Double = 0.0
    var R = 10.0
    var width: Double = 0.0
    var height: Double = 0.0
    override func loadView() {
        
        super.loadView()
        var center = self.view.bounds.size
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        ban1 = UIImageView(frame: CGRect(x: 0, y: 0, width: center.width, height: center.height - 60))
        ban1!.image = UIImage(named: "ban1.jpg")
        self.view.addSubview(ban1!)
        bi0 = UIImageView(frame: CGRect(x: center.width * 0.5, y: center.height - 380, width: 20, height: 20))
        bi0!.image = UIImage(named: "bi0.png")
        self.view.addSubview(bi0!)
        bi6 = UIImageView(frame: CGRect(x: center.width * 0.29, y: center.height * 0.49, width: 20, height: 20))
        bi6!.image = UIImage(named: "bi6.png")
        self.view.addSubview(bi6!)
        bi8 = UIImageView(frame: CGRect(x: center.width * 0.35, y: center.height * 0.35, width: 20, height: 20))
        bi8!.image = UIImage(named: "bi8.png")
        self.view.addSubview(bi8!)
        bi10 = UIImageView(frame: CGRect(x: center.width * 0.15, y: center.height * 0.5, width: 20, height: 20))
        bi10!.image = UIImage(named: "bi10.png")
        self.view.addSubview(bi10!)
        bi13 = UIImageView(frame: CGRect(x: center.width * 0.46, y: center.height * 0.2, width: 20, height: 20))
        bi13!.image = UIImage(named: "bi13.png")
        self.view.addSubview(bi13!)
        bi15 = UIImageView(frame: CGRect(x: center.width * 0.8, y: center.height * 0.1, width: 20, height: 20))
        bi15!.image = UIImage(named: "bi15.png")
        self.view.addSubview(bi15!)
        gay1 = UIImageView(frame: CGRect(x: center.width * 0.5, y: center.height - 380 , width: 10, height: 260))
        gay1!.image = UIImage(named: "gay1.png")
        self.gay1?.layer.anchorPoint = CGPointMake(0.5,0)
        self.view.addSubview(gay1!)
        let tap = UITapGestureRecognizer(target: self, action: "onTap:")
        self.view.addGestureRecognizer(tap)
        
        gay1?.multipleTouchEnabled = true
        gay1?.userInteractionEnabled = true
        width = Double(center.width - 15)
        height = Double(center.height - 15)
        bi0?.multipleTouchEnabled = true
        bi0?.userInteractionEnabled = true
        let rotate = UIRotationGestureRecognizer(target: self, action: "OnRotate:")
        self.view.addGestureRecognizer(rotate)
        let pan = UIPanGestureRecognizer(target: self, action: "onPan:")
        gay1!.addGestureRecognizer(pan)
        let pan1 = UIPanGestureRecognizer(target: self, action: "panIt:")
        bi0?.addGestureRecognizer(pan1)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.016, target: self, selector: "loop:", userInfo: nil, repeats: true)
        timer?.fire()
    }
    
    func panIt(pan1: UIPanGestureRecognizer) {
        if (pan1.state == UIGestureRecognizerState.Began || pan1.state == UIGestureRecognizerState.Changed) {
            let veloccity = pan1.velocityInView(self.view)
            vX += Double(veloccity.x) * 5 / width
            vY += Double(veloccity.y) * 5 / height
        }
    }
    func onTap (tap: UITapGestureRecognizer) {
        let point = tap.locationInView(self.view)
        self.gay1?.center = CGPoint(x: point.x, y: point.y )
    }
    
    func OnRotate (rotate: UIRotationGestureRecognizer) {
            gay1?.transform = CGAffineTransformMakeRotation(rotate.rotation)
    }
    
    func onPan (pan: UIPanGestureRecognizer) {
        if (pan.state == UIGestureRecognizerState.Began || pan.state == UIGestureRecognizerState.Changed) {
            gay1!.center = pan.locationInView(self.view)
        }
    }
    
    
    func loop(timer: NSTimer) {
        var x1 = Double(bi0!.center.x) + vX
        var y1 = Double(bi0!.center.y) + vY
        if x1 < R + 10 {
            x1 = R + 10
            vX = -vX
        }
        if x1 > width - R {
            x1 = width - R
            vX = -vX
        }
        if y1 < R + 10  {
            y1 = R + 10
            vY = -vY
        }
        if y1 > height - R - 55 {
            y1 = height - R - 55
            vY = -vY
        }
        
        bi0!.center = CGPoint(x: x1, y: y1)
        vX = 0.96 * vX
        vY = 0.96 * vY
        
       
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
        
}