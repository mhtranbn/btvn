//
//  DemoPanGravity.swift
//  DynamicsKitDemo
//
//  Created by mhtran on 10/17/14.
//  Copyright (c) 2014 vn.Techmsater. All rights reserved.
//

import UIKit
import AVFoundation

class DemoPanGravity: UIViewController {
    var bi: UIImageView?
    var animator: UIDynamicAnimator?
    var gravity = UIGravityBehavior()
    var collider = UICollisionBehavior()
    var audioPlayer = AVAudioPlayer()
    
    override func loadView() {
        super.loadView()
        var size = self.view.bounds.size
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        bi = UIImageView(frame: CGRect(x: size.width * 0.5, y: 0, width: 60, height: 60))
        bi?.image = UIImage(named: "bi0.png")
        let tap = UITapGestureRecognizer(target: self, action: "onTap:")
        self.view.addGestureRecognizer(tap)
    }
    
    func configureDynamicKit() {
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity.gravityDirection = CGVectorMake(0.0, 0.8)
        animator!.addBehavior(gravity)
        collider.translatesReferenceBoundsIntoBoundary = true
        animator!.addBehavior(collider)
    }
    
    func addBoxToPhysic() {
        configureDynamicKit()
        collider.addItem(bi!)
        gravity.addItem(bi!)
        
    }
    
    func onTap(tap: UIGestureRecognizer) {
        let point = tap.locationInView(self.view)
        self.bi?.center = CGPoint(x: point.x, y: point.y)
        self.view.addSubview(bi!)
        NSLog("cham bi")
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(),{
            self.addBoxToPhysic()
            NSLog("Roibi")
        })
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(),{
            self.AudioScrore()
            NSLog("Roibi")
        })

    }
    
    func AudioScrore() {
        var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("point", ofType: "wav")!)
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        var error:NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
}
