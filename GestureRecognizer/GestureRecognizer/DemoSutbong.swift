//
//  DemoSutbong.swift
//  GestureRecognizer
//
//  Created by mhtran on 10/13/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoSutbong: UIViewController {
    
    var sanbong, thumon, bong : UIImageView?
    var timer, timer2 : NSTimer?
    var vX: Double = 0.0
    var vY: Double = 0.0
    var width: Double = 0.0
    var height: Double = 0.0
    var scoreLabel:UILabel?
    var score:NSNumber?
    var quaVachVoi:Bool?
    var ketqua:UILabel?
    override func loadView() {
        super.loadView()
        var center = self.view.bounds.size
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        sanbong = UIImageView(frame: CGRect(x: 0, y: 0, width: center.width, height: center.height))
        sanbong?.image = UIImage(named: "sanbong.png")
        self.view.addSubview(sanbong!)
        
        thumon = UIImageView(frame: CGRect(x: center.width * 0.5, y: 130, width: 50, height: 90))
        
        thumon?.image = UIImage(named: "thumon.png")
        self.view.addSubview(thumon!)
        quaVachVoi = false
        bong = UIImageView(frame: CGRect(x: center.width * 0.5, y: center.height - 120, width: 20, height: 20))
        bong?.image = UIImage(named: "bong.png")
        self.view.addSubview(bong!)
        score = 0
        scoreLabel = UILabel(frame: CGRect(x:0, y:0, width:200, height:50))
        scoreLabel!.text = "SCORE: 0"
        scoreLabel!.textAlignment = NSTextAlignment.Center
        scoreLabel?.textColor = UIColor(white: 1, alpha: 1)
        self.view.addSubview(scoreLabel!)
        scoreLabel?.center.x = self.view.bounds.size.width/2
        scoreLabel?.center.y = 30
        
        ketqua = UILabel(frame: CGRect(x:0, y:0, width:300, height:50))
        ketqua!.text = "Doi sut bong"
        ketqua!.textAlignment = NSTextAlignment.Center
        ketqua?.textColor = UIColor(white: 1, alpha: 1)
        self.view.addSubview(ketqua!)
        ketqua?.center.x = self.view.bounds.size.width/2
        ketqua?.center.y = self.view.bounds.size.height/2
        
        //        var bong2:UIImageView = UIImageView(frame: CGRect(x: 60, y: 160, width: 20, height: 20))
        //        bong2.image = UIImage(named: "bong.png")
        //        self.view.addSubview(bong2)
        
        
        bong!.multipleTouchEnabled = true
        bong!.userInteractionEnabled = true
        let pan = UIPanGestureRecognizer(target: self, action: "onPan:")
        bong?.addGestureRecognizer(pan)
        width = Double(center.width - 15)
        height = Double(center.height - 15)
        timer2 = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "runthumon", userInfo: nil, repeats: true)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "loop:", userInfo: nil, repeats: true)
    }
    
    func runthumon () {
        UIView.animateWithDuration(1,
            animations: {
                var sizes = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.thumon?.center = CGPoint(x: sizes.x - CGFloat(arc4random_uniform(UInt32(sizes.x))), y: 175)
                self.thumon?.alpha = 1
            },
            completion: { finished in })
        
    }
    
    func onPan(pan: UIPanGestureRecognizer) {
        if (pan.state == UIGestureRecognizerState.Began || pan.state == UIGestureRecognizerState.Changed) {
            let veloccity = pan.velocityInView(self.view)
            vX += Double(veloccity.x) * 2 / width
            vY += Double(veloccity.y) * 2 / height
        }
    }
    
    func loop(timer: NSTimer) {
        var center = self.view.bounds.size
        var x1 = Double(bong!.center.x) + vX
        var y1 = Double(bong!.center.y) + vY
        //kiem tra toi vach voi
        if (!quaVachVoi!){
            if y1 <= Double(thumon!.center.y + thumon!.frame.height / 2) {
                // toi vach voi, kiem tra trong hay ngoai gon
                
                // gon 60 -> center.width - 60
                quaVachVoi = true
                
                if (x1 >= Double(thumon!.center.x - thumon!.bounds.size.width*0.75) && x1 <= Double(thumon!.center.x + thumon!.bounds.size.width*0.75))  {
                    // thu mon bat duoc bong, qua bong dung lai va delay 1s sau thi reset vi tri qua bong va sut lai
                    NSLog("Bat BONG")
                    ketqua?.text = "Bat BONG"
                    vX = 0
                    vY = 0
                    bong!.center = thumon!.center
                    stop()
                    NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: "runthumon", userInfo: nil, repeats: false)
                    
                }else
                {
                    if (((x1 >= 50) && (x1 <= 70)) || ((x1 >= (Double(center.width) - 70)) && (x1 <= Double(center.width) - 50))) {
                        // trung cot, cho qua bong bat lai
                        vY = -vY
                        NSLog("Trung COT")
                        ketqua!.text = "Trung COT"
                        stop()
                        
                    }else{
                        if (x1 > 60 && x1 < Double(center.width) - 60){
                            // vao trong gon:
                            // cong diem len 1, delay 1s roi tao luot moi
                            vX = 0
                            vY = 0
                            stop()
                            NSLog("Vao GOL")
                            ketqua!.text = "Vao GON"
                            score = Int(score!) + 1
                            scoreLabel!.text = "SCORE:" + score!.stringValue
                            
                        }else
                        {
                            // ra ngoai gon, reset sau 1s
                            stop()
                            NSLog("Ra NGOAI")
                            ketqua!.text = "RA NGOAI"
                        }
                    }
                }
            }
        }
        
        bong!.center = CGPoint(x: x1, y: y1)
        vX = 0.96 * vX
        vY = 0.96 * vY
    }
    
    func stop(){
        
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "reset:", userInfo: nil, repeats: false)
        
        
    }
    func reset(_timer: NSTimer?){
        
        bong!.center.x = self.view.bounds.size.width/2
        bong!.center.y = self.view.bounds.size.height - 120
        quaVachVoi = false
        vX = 0
        vY = 0
        timer?.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "loop:", userInfo: nil, repeats: true)
        ketqua!.text = "Doi sut bong"
        
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
    
    
}

