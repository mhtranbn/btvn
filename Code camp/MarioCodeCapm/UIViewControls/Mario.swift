
//
//  Mario.swift
//  UIViewControls
//
//  Created by mhtran on 16/3/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit
import AVFoundation

class Mario: UIViewController {
    var audioPlayer = AVAudioPlayer()
    var mario: UIImageView?
    var Over: UIImageView?
    var city1, city2, city3, city4, box , box2, box5, box6, box7, box8, box9, box10: UIImageView?
    var _timer: NSTimer?
    var viewHeight: Double = 0.0
    var moveX = 20
    let cityWidth: Double = 1498
    let cityHeight: Double = 400
    var velY: Double = 0.0
    var accY: Double = 18.0
    var y : Double = 0
    var x : CGFloat = 0
    var boxX : Double = 40
    var boxY : Double = 40
    var maxHeight: Double = 0.0
    var jumped : Bool = false
    var minHeight : Double = 450
    var tapNext : Bool = false
    var highJump : Bool = false
    var point : Int = 0
    var pointLabel : UILabel = UILabel()
    var gameOverLabel : UILabel = UILabel()
    var gameOverView : UIView!
    var gameOverY : Double = 0
    var imgListArray :NSMutableArray = []
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        let viewSize = self.view.bounds.size
        viewHeight = Double(viewSize.height) - 60
        var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
        
        city1 = UIImageView(frame: CGRect(x: 0, y: viewHeight - cityHeight, width: cityWidth, height: cityHeight))
        city1!.image = UIImage(named: "city1.png")
        self.view.addSubview(city1!)
        city4 = UIImageView(frame: CGRect(x: cityWidth, y: viewHeight - cityHeight, width: cityWidth, height: cityHeight))
        city4!.image = UIImage(named: "city1.png")
        self.view.addSubview(city4!)
        
        box = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        box?.image = UIImage(named: "box.png")
        box!.center = CGPoint(x: viewSize.width , y: CGFloat(viewHeight) - 10 - CGFloat(boxY) * 0.5)
        box2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        box2?.image = UIImage(named: "box.png")
        box2!.center = CGPoint(x: viewSize.width - 20, y: CGFloat(viewHeight) - 10 - CGFloat(boxY) * 0.5)
        self.view.addSubview(box!)
        //self.view.addSubview(box2!)
        box5 = UIImageView(frame: CGRect(x: centerPoint.x, y:centerPoint.y * 0.5 - 100, width: 50, height: 50))
        box5!.image = UIImage(named: "box5.png")
        self.view.addSubview(box5!)
        
        box6 = UIImageView(frame: CGRect(x: centerPoint.x, y:centerPoint.y * 0.5 - 85, width: 30, height: 30))
        box6!.image = UIImage(named: "box6.png")
        self.view.addSubview(box6!)
        
        box7 = UIImageView(frame: CGRect(x: centerPoint.x, y:centerPoint.y * 0.5 - 75, width: 80, height: 80))
        box7!.image = UIImage(named: "box7.png")
        self.view.addSubview(box7!)
        
        box8 = UIImageView(frame: CGRect(x: centerPoint.x, y:centerPoint.y * 0.5 - 65, width: 80, height: 80))
        box8!.image = UIImage(named: "box8.png")
        self.view.addSubview(box8!)
        
        box9 = UIImageView(frame: CGRect(x: centerPoint.x, y:centerPoint.y * 0.5 - 50, width: 80, height: 80))
        box9!.image = UIImage(named: "box9.png")
        self.view.addSubview(box9!)
        
        box10 = UIImageView(frame: CGRect(x: centerPoint.x, y:centerPoint.y * 0.5 - 45, width: 80, height: 80))
        box10!.image = UIImage(named: "box10.png")
        self.view.addSubview(box10!)
        
        
        pointLabel = UILabel(frame: CGRect(x: 50, y: 50, width: 190, height: 40))
        pointLabel.font = UIFont(name: "Zapfino", size: 20)
        pointLabel.textColor = UIColor.redColor()
        pointLabel.text = "Point : 0"
        self.view.addSubview(pointLabel)
        
        gameOverLabel = UILabel(frame: CGRect(x: viewSize.width - 200, y: 50, width: 250, height: 250))
        
        mario = UIImageView(frame: CGRect(x: 0, y: 0, width: 65, height: 102))
        mario?.center = CGPoint(x: viewSize.width * 0.5 - 130, y: CGFloat(viewHeight) - 10 - mario!.bounds.size.height * 0.5)
        mario!.userInteractionEnabled = true
        mario!.multipleTouchEnabled = true
        for countValue in 1...8
        {
            
            var strImageName : String = "\(countValue).png"
            var image  = UIImage(named:strImageName)
            imgListArray .addObject(image!)
        }
        mario!.animationImages = imgListArray
        mario!.animationDuration = 1.0
        
        self.view.addSubview(mario!)
        mario!.startAnimating()
        maxHeight = viewHeight - 10 - Double(mario!.bounds.size.height) * 0.5
        x = viewSize.width * 0.5
        y = viewHeight - 10 - Double(mario!.bounds.size.height) * 0.5
        let tap = UITapGestureRecognizer(target: self, action: "tapOnMario")
        self.view.addGestureRecognizer(tap)
        self._timer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: "runBox5", userInfo: nil, repeats: true)
        self._timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "runCity", userInfo: nil, repeats: true)
        self._timer?.fire()
    }
    
    func runBox5() {
        UIView.animateWithDuration(1,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box5?.center = CGPoint(x: centerPoint.x - 30 - CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y:centerPoint.y * 0.5 - 150)
                self.box5?.alpha = 1
            },
            completion: { finished in })
        runBox6()
    }
    
    func runBox6() {
        UIView.animateWithDuration(1,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box6?.center = CGPoint(x: centerPoint.x - CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y:centerPoint.y * 0.5 - 185)
                self.box6?.alpha = 1
            },
            completion: { finished in })
        runBox7()
    }
    func runBox7() {
        UIView.animateWithDuration(1,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box7?.center = CGPoint(x: centerPoint.x + 30 - CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y:centerPoint.y * 0.5 - 195)
                self.box7?.alpha = 1
            },
            completion: { finished in })
        runBox8()
    }
    
    func runBox8() {
        UIView.animateWithDuration(1,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box8?.center = CGPoint(x: centerPoint.x - CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y:centerPoint.y * 0.5 - 200)
                self.box8?.alpha = 1
            },
            completion: { finished in })
        runBox9()
    }
    
    func runBox9() {
        UIView.animateWithDuration(1,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box9?.center = CGPoint(x: centerPoint.x + 10 - CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y:centerPoint.y * 0.5 - 205)
                self.box9?.alpha = 1
            },
            completion: { finished in })
        runBox10()
    }
    
    func runBox10() {
        UIView.animateWithDuration(1,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box10?.center = CGPoint(x: centerPoint.x + 55 - CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y:centerPoint.y * 0.5 - 180)
                self.box10?.alpha = 1
            },
            completion: { finished in })
        
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
    
    func AudioGameOver() {
        var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("gameover", ofType: "wav")!)
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        var error:NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
//    func gameOver () {
//        
//        
//            var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5 , y: self.view.bounds.size.height * 0.5 )
//            self.Over!.image = UIImage(named: "bunnyGameO.png")
//            self.Over!.center = CGPoint(x: centerPoint.x , y: centerPoint.y * 2 + 120)
//      
//
//        
//        
//        //        self.mario?.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
//        
//        
//    }

    
    func runCity() {
        box!.center = CGPoint(x: box!.center.x - CGFloat(moveX), y: box!.center.y)
        if box!.frame.origin.x + 40 < 0 {
            box!.frame = CGRect(x: Double(box2!.frame.origin.x) + 40, y: Double(box!.frame.origin.y), width: 40, height: 40)
            AudioScrore()
            point++
            pointLabel.text = "Point: \(point)"
        }
        if box2!.frame.origin.x + CGFloat(40) < 0 {
            box2!.frame = CGRect(x: Double(box!.frame.origin.x) + 40, y: Double(box!.frame.origin.y), width: 40, height: 40)
            AudioScrore()
            point++
            pointLabel.text = "Point: \(point)"
        }
        city1!.center = CGPoint(x: city1!.center.x - CGFloat(moveX), y: city1!.center.y)
        city4!.center = CGPoint(x: city4!.center.x - CGFloat(moveX), y: city4!.center.y)
        
        if city1!.frame.origin.x + CGFloat(cityWidth) < 0 {
            city1!.frame = CGRect(x: Double(city4!.frame.origin.x) + cityWidth, y: Double(city1!.frame.origin.y), width: cityWidth, height: cityHeight)
            println("move 1")
        }
        if city4!.frame.origin.x + CGFloat(cityWidth) < 0 {
            city4!.frame = CGRect(x: Double(city1!.frame.origin.x) + cityWidth, y: Double(city1!.frame.origin.y), width: cityWidth, height: cityHeight)
            println("move 2")
        }
        if ((mario!.center.x) < (box!.center.x + 20) && (mario!.center.x) > (box!.center.x - 20) && (mario!.center.y + 60) > (box!.center.y - 20)){
            var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5 , y: self.view.bounds.size.height * 0.5 )
            
            
//            UIView.animateWithDuration(1.0, animations: {
//                self.gameOverView.center = CGPoint(x: 200, y: 200)
//                println("\(self.gameOverY)")
//                },
//                completion:{finished in
//            })
            _timer?.invalidate()
            _timer = nil
            pointLabel.text = "Point: \(point)"
//            var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5 , y: self.view.bounds.size.height * 0.5 )
            mario!.stopAnimating()
            mario?.image = UIImage(named: "bunnyDie.png")
            self.mario?.center = CGPoint(x: centerPoint.x , y: centerPoint.y * 2 - 30)
            UIView.animateWithDuration(1.0, animations: {
            self.Over = UIImageView(frame: CGRect(x: 0, y: 0, width: 192, height: 112))
            self.Over?.center = CGPoint(x: centerPoint.x, y: centerPoint.y)
            self.Over!.image = UIImage(named: "bunnyGameO.png")
            self.Over?.center = CGPoint(x: centerPoint.x , y: centerPoint.y )
            self.view.addSubview(self.Over!)
            },
                       completion:{finished in
                     })
            AudioGameOver()
            
            
        }
        if (jumped == true) {
            
            y -= accY
            
            if y < minHeight {
                accY *= -1
                y = minHeight
                
            }else if(y > maxHeight) {
                jumped = false
                accY *= -1
                y = maxHeight
            }
            
            mario?.center = CGPoint(x: Double(x) * 0.5, y: y + 20)
            
        }
        
        
    }
    func tapOnMario() {
        jumped = true
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        _timer?.invalidate()
        _timer = nil
    }
}
