//
//  DemoImpossible.swift
//  GestureRecognizer
//
//  Created by mhtran on 10/13/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit
import AudioToolbox


class DemoImpossible: UIViewController {
    var hv, bi, gameOver: UIImageView?
    var xoay = M_PI_2 * 0
    var vY : Double = 0
    var timer: NSTimer?
    var delTa : Double = 0.005
    var t: Double = 0.016
    var chamhv: Bool?
    var imageIndex: Int?
    var score: NSNumber?
    var scoreLabel: UILabel?
    let imagefull = ["red.png", "blue.png", "green.png", "yelow.png"]
    
    
    override func loadView() {
        super.loadView()
        let chaChingSound: SystemSoundID = createChaChingSound()
        var size = self.view.bounds.size
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        gameOver = UIImageView(frame: CGRect(x: size.width * 0.5, y: size.height * 0.5, width: size.width - 80, height: size.height - 300))
        bi = UIImageView(frame: CGRect(x:0  , y:0 , width: 30, height: 30))
        bi?.center = CGPoint(x: size.width * 0.5, y: 80)
        imageIndex = Int(arc4random_uniform(UInt32(imagefull.count)))
        bi?.image = UIImage(named: imagefull[Int(imageIndex!)])
        self.view.addSubview(bi!)
        hv = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width - 200, height: size.width - 200))
        hv?.center = CGPoint(x: size.width * 0.5, y: size.height - 180)
        NSLog("\(size.height - 180)")
        hv?.image = UIImage(named: "hv.png")
        self.view.addSubview(hv!)
        score = 0
        scoreLabel = UILabel(frame: CGRect(x:0, y:0, width:200, height:50))
        scoreLabel!.text = "SCORE: 0"
        scoreLabel!.textAlignment = NSTextAlignment.Center
        scoreLabel?.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(scoreLabel!)
        scoreLabel?.center.x = self.view.bounds.size.width/2
        scoreLabel?.center.y = 30

        //tap de xoay hinh vuong 1 goc pi/2
        let tap = UITapGestureRecognizer(target: self, action: "onTap:")
        self.view.addGestureRecognizer(tap)
        chamhv = false

        timer = NSTimer.scheduledTimerWithTimeInterval(t, target: self, selector: "biRoi:", userInfo: nil, repeats: true)
    }
    //bi roi xuong voi gia toc trong truong
    func biRoi(timer: NSTimer) {
let chaChingSound: SystemSoundID = createChaChingSound()
        //tinh van toc tai thoi diem t
        vY += 9.8 * delTa
        var y1 = Double(bi!.center.y) + vY
        bi!.center = CGPoint(x: bi!.center.x, y: CGFloat(y1))
        NSLog("\n Biroi")
        NSLog("\n vien \(Double(hv!.center.y - hv!.bounds.size.height * 0.5 + 60)) ")
        NSLog( "\n bi mau so \(imageIndex!) ")
        // kiem tra xem bi cham hv
        
        if(!chamhv!) {
            if (y1 >= Double(hv!.center.y - hv!.bounds.size.height * 0.5 + bi!.bounds.size.width * 0.5)) {
                chamhv = true
                //kiem tra mau bi vs mau hv
                
                if (imageIndex! == Int(((xoay / M_PI_2) % 4))) {
                    NSLog("\n bi cung mau hv")
                    AudioServicesPlaySystemSound(chaChingSound)
                    reset()
                } else {
                    NSLog("\n bi khac mau")
                    stop()
                }
            }
        }
        
    }
    
    func createChaChingSound() -> SystemSoundID {
        var soundID: SystemSoundID = 0
        let soundURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), "emptytrash", "aiff", nil)
        AudioServicesCreateSystemSoundID(soundURL, &soundID)
//        CFRelease(soundURL)
        return soundID
    }
    
    func reset() {
        NSTimer.scheduledTimerWithTimeInterval(t, target: self, selector: "reset1:", userInfo: nil, repeats: false)
    }
    
    func reset1 (_timer: NSTimer?) {
        var size = self.view.bounds.size
        //goi lai bi ve vi tri dau vs chay tiep
        bi?.center = CGPoint(x: size.width * 0.5, y: 80)
        imageIndex = Int(arc4random_uniform(UInt32(imagefull.count)))
        bi?.image = UIImage(named: imagefull[Int(imageIndex!)])
        self.view.addSubview(bi!)
        self.view.addSubview(hv!)
        chamhv = false
        vY = 0
        timer?.invalidate()
        // tang toc do bi roi len dan theo thoi gian
        t -= 0.0002
        timer = NSTimer.scheduledTimerWithTimeInterval(t, target: self, selector: "biRoi:", userInfo: nil, repeats: true)
        score = score! + 1
        NSLog("\n cong diem")
        scoreLabel!.text = "SCORE:" + score!.stringValue
    }
    func stop () {
        // dung game lai bang ham gameOver
        timer?.invalidate()
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "gameOver:", userInfo: nil, repeats: false)
        NSLog("\n dung game")
        vY = 0
    }
    
    func gameOver(_timer: NSTimer) {
        var size = self.view.bounds.size
        gameOver = UIImageView(frame: CGRect(x: size.width * 0.5, y: size.height * 0.5, width: size.width - 180, height: size.height - 400))
        gameOver?.center = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        gameOver?.image = UIImage(named: "gameOver.png")
        self.view.addSubview(gameOver!)
        NSLog("\n hien game over banner")
        timer?.invalidate()
    }
    func onTap(tap : UITapGestureRecognizer) {
        xoay += M_PI_2
        self.hv!.transform = CGAffineTransformMakeRotation(CGFloat(xoay))
        NSLog("\n tap \(xoay/M_PI_2)")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
    
    

}
