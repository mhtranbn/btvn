//
//  InteriorDesign.swift
//  GestureRecognizer
//
//  Created by mhtran on 10/3/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class InteriorDesign: UIViewController {

    var  floorplan, cay1, cay2 : UIImageView?
    
    
    
    
    override func loadView() {
        super.loadView()
        let size = self.view.bounds.size
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        floorplan = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 400))
        floorplan!.image = UIImage(named: "floorplan.png")
        self.view.addSubview(floorplan!)
        
        cay1 = UIImageView(frame: CGRect(x:  30, y:  size.height - 150 , width: 50, height: 50))
        cay1!.image = UIImage(named: "cay1.png")
        self.view.addSubview(cay1!)
        
        cay2 = UIImageView(frame: CGRect(x: size.width - 70, y:  size.height - 150 , width: 50, height: 50))
        cay2!.image = UIImage(named: "cay2.png")
        self.view.addSubview(cay2!)
        cay1!.multipleTouchEnabled = true
        cay1!.userInteractionEnabled = true
        cay2!.multipleTouchEnabled = true
        cay2!.userInteractionEnabled = true
        let pan1 = UIPanGestureRecognizer(target: self, action: "onPan1:")
        cay2?.addGestureRecognizer(pan1)
        
        let pan = UIPanGestureRecognizer(target: self, action: "onPan:")
        cay1?.addGestureRecognizer(pan)
        
    }
    
    func onPan (pan: UIPanGestureRecognizer) {
        if (pan.state == UIGestureRecognizerState.Began || pan.state == UIGestureRecognizerState.Changed) {
            cay1!.center = pan.locationInView(self.view)
        }
    }
    
    func onPan1 (pan1: UIPanGestureRecognizer) {
        if (pan1.state == UIGestureRecognizerState.Began || pan1.state == UIGestureRecognizerState.Changed) {
            cay2!.center = pan1.locationInView(self.view)
        }
    }
 
}

