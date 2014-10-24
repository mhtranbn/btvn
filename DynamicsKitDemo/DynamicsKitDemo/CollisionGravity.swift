//
//  CollisionGravity.swift
//  DynamicsKitDemo
//
//  Created by mhtran on 10/22/14.
//  Copyright (c) 2014 vn.Techmsater. All rights reserved.
//

import UIKit

class CollisionGravity: UIViewController {
    var box, background: UIImageView?
    var animator: UIDynamicAnimator?
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    
    override func loadView() {
        super.loadView()
        self.edgesForExtendedLayout = UIRectEdge.None
        background = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        background?.image = UIImage(named: "image#2.png")
        self.view.addSubview(background!)
        box = UIImageView(frame: CGRect(x: self.view.bounds.size.width * 0.5 - 30 , y: 40, width: 60, height: 60))
        box?.image = UIImage(named: "image#4.png")
        self.view.addSubview(box!)
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity.gravityDirection = CGVectorMake(0.0, 0.8)
        animator?.addBehavior(gravity)
        collision.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collision)
        collision.addItem(box!)
        gravity.addItem(box!)
    }
    
}
