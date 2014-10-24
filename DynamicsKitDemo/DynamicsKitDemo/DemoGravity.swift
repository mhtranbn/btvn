//
//  DemoGravity.swift
//  DynamicsKitDemo
//
//  Created by mhtran on 10/22/14.
//  Copyright (c) 2014 vn.Techmsater. All rights reserved.
//

import UIKit

class DemoGravity: UIViewController {
    var box,background: UIImageView?
    var animator: UIDynamicAnimator?
    let gravity = UIGravityBehavior()
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        background = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        background?.image = UIImage(named: "image#2")
        self.view.addSubview(background!)
        box = UIImageView(frame: CGRect(x: self.view.bounds.size.width * 0.5, y: 0, width: 60, height: 60))
        box!.image = UIImage(named: "image#3.png")
        box!.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: 60)
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity.gravityDirection = CGVectorMake(0.0, 0.4)
        animator!.addBehavior(gravity)
        self.view.addSubview(box!)
        gravity.addItem(box!)
    }
}
