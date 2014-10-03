//
//  Mario.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 9/29/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class Mario: UIViewController {
    var mario: UIImageView?
    var box, box1, box2, box3, box4, box5, box6, box7, box8, box9, box10: UIImageView?
    var city1, city2, city3, city4: UIImageView?
    var _timer: NSTimer?
    var viewHeight: Double = 0.0
    var moveX = 20
    let deltaMove = 5
    let cityWidth: Double = 1498
    let cityHeight: Double = 400
    override func loadView() {
        super.loadView()
        moveX += deltaMove
        var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        let viewSize = self.view.bounds.size
        viewHeight = Double(viewSize.height) - 60
        city1 = UIImageView(frame: CGRect(x: 0, y: viewHeight - cityHeight, width: cityWidth, height: cityHeight))
        city1!.image = UIImage(named: "city1.png")
        self.view.addSubview(city1!)
        /*
        city2 = UIImageView(frame: CGRect(x: cityWidth, y: viewHeight - cityHeight, width: cityWidth, height: cityHeight))
        city2!.image = UIImage(named: "city2.png")
        self.view.addSubview(city2!)
        
        city3 = UIImageView(frame: CGRect(x: cityWidth * 2, y: viewHeight - cityHeight, width: cityWidth, height: cityHeight))
        city3!.image = UIImage(named: "city3.png")
        self.view.addSubview(city3!) */
        
        city4 = UIImageView(frame: CGRect(x: cityWidth, y: viewHeight - cityHeight, width: cityWidth, height: cityHeight))
        city4!.image = UIImage(named: "city1.png")
        self.view.addSubview(city4!)
        
        box = UIImageView(frame: CGRect(x: centerPoint.x * 0.5, y:0, width: 30, height: 30))
        box!.image = UIImage(named: "box.jpg")
        self.view.addSubview(box!)
        
        box1 = UIImageView(frame: CGRect(x: centerPoint.x, y:0, width: 30, height: 30))
        box1!.image = UIImage(named: "box1.png")
        self.view.addSubview(box1!)
        
        box2 = UIImageView(frame: CGRect(x: centerPoint.x, y:0, width: 30, height: 30))
        box2!.image = UIImage(named: "box2.png")
        self.view.addSubview(box2!)
        
        box3 = UIImageView(frame: CGRect(x: centerPoint.x, y:0, width: 30, height: 30))
        box3!.image = UIImage(named: "box3.png")
        self.view.addSubview(box3!)
        
        box4 = UIImageView(frame: CGRect(x: centerPoint.x, y:0, width: 30, height: 30))
        box4!.image = UIImage(named: "box4.png")
        self.view.addSubview(box4!)
        
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

        mario = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 80))
        
        mario?.center = CGPoint(x: viewSize.width * 0.5, y: CGFloat(viewHeight) - 10 - mario!.bounds.size.height * 0.5)
//        self.mario?.layer.anchorPoint = CGPointMake(0.5, 0)
        mario!.userInteractionEnabled = true
        mario!.multipleTouchEnabled = true
        mario!.animationImages = [
            UIImage(named: "1.png"),
            UIImage(named: "2.png"),
            UIImage(named: "3.png"),
            UIImage(named: "4.png"),
            UIImage(named: "5.png"),
            UIImage(named: "6.png"),
            UIImage(named: "7.png"),
            UIImage(named: "8.png")
        ]
        mario!.animationDuration = 1.0
        self.view.addSubview(mario!)
        mario!.startAnimating()
        let tap = UITapGestureRecognizer(target: self, action: "tapOnMario")
        self.view.addGestureRecognizer(tap)
        self._timer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: "runBox", userInfo: nil, repeats: true)
        self._timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "runCity", userInfo: nil, repeats: true)
        self._timer?.fire()
    }
    
    func runBox() {
        UIView.animateWithDuration(1,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box?.center = CGPoint(x: centerPoint.x - CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y: centerPoint.y - 190)
                self.box?.alpha = 1
            },
            completion: { finished in })
            runBox1()
    }
    
    func runBox1() {
        UIView.animateWithDuration(3,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box1?.center = CGPoint(x: centerPoint.x * 0.75 - CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y: centerPoint.y - 180)
                self.box1?.alpha = 1
            },
            completion: { finished in })
        runBox2()
    }

    func runBox2() {
//        UIView.animateWithDuration(3,
//            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box2?.center = CGPoint(x: centerPoint.x * 1.25 - CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y: centerPoint.y - 195)
//                self.box2?.alpha = 1
//            },
//            completion: { finished in })
        runBox3()
    }
    
    func runBox3() {
//        UIView.animateWithDuration(2,
//            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box3?.center = CGPoint(x: centerPoint.x - CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y: centerPoint.y - 15)
//                self.box3?.alpha = 1
//            },
//            completion: { finished in })
        runBox4()
    }

    func runBox4() {
        UIView.animateWithDuration(2,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box4?.center = CGPoint(x:centerPoint.x + 300 - 2 * CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y: centerPoint.y - 15)
                self.box4?.alpha = 1
            },
            completion: { finished in })
        runBox5()
    }
    
    func runBox5() {
        UIView.animateWithDuration(5,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box5?.center = CGPoint(x: centerPoint.x - 30 - CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y:centerPoint.y * 0.5 - 150)
                self.box5?.alpha = 1
            },
            completion: { finished in })
        runBox6()
    }
    
    func runBox6() {
        UIView.animateWithDuration(5,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box6?.center = CGPoint(x: centerPoint.x - CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y:centerPoint.y * 0.5 - 185)
                self.box6?.alpha = 1
            },
            completion: { finished in })
        runBox7()
    }
    func runBox7() {
        UIView.animateWithDuration(5,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box7?.center = CGPoint(x: centerPoint.x + 30 - CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y:centerPoint.y * 0.5 - 195)
                self.box7?.alpha = 1
            },
            completion: { finished in })
        runBox8()
    }
    
    func runBox8() {
        UIView.animateWithDuration(5,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box8?.center = CGPoint(x: centerPoint.x - CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y:centerPoint.y * 0.5 - 200)
                self.box8?.alpha = 1
            },
            completion: { finished in })
            runBox9()
    }

    func runBox9() {
        UIView.animateWithDuration(5,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box9?.center = CGPoint(x: centerPoint.x + 10 - CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y:centerPoint.y * 0.5 - 205)
                self.box9?.alpha = 1
            },
            completion: { finished in })
        runBox10()
    }

    func runBox10() {
        UIView.animateWithDuration(5,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
                self.box10?.center = CGPoint(x: centerPoint.x + 55 - CGFloat(arc4random_uniform(UInt32(centerPoint.x))), y:centerPoint.y * 0.5 - 180)
                self.box10?.alpha = 1
            },
            completion: { finished in })
        
    }

    func runCity() {
        city1!.center = CGPoint(x: city1!.center.x - CGFloat(moveX), y: city1!.center.y)
       /* city2!.center = CGPoint(x: city2!.center.x - CGFloat(moveX), y: city2!.center.y)
        city3!.center = CGPoint(x: city3!.center.x - CGFloat(moveX), y: city3!.center.y) */
        city4!.center = CGPoint(x: city4!.center.x - CGFloat(moveX), y: city4!.center.y)
        
        if city1!.frame.origin.x + CGFloat(cityWidth) < 0 {
            city1!.frame = CGRect(x: Double(city4!.frame.origin.x) + cityWidth, y: Double(city1!.frame.origin.y), width: cityWidth, height: cityHeight)
            println("move 1")
            
        }
        
        if city4!.frame.origin.x + CGFloat(cityWidth) < 0 {
            city4!.frame = CGRect(x: Double(city1!.frame.origin.x) + cityWidth, y: Double(city1!.frame.origin.y), width: cityWidth, height: cityHeight)
            println("move 2")
        }
        
    }
    
    func jump1() {
        
        UIView.animateWithDuration(0.1,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
                self.mario?.center = CGPoint(x: centerPoint.x , y: centerPoint.y * 2 - 100)
                self.mario?.alpha = 1
            },
            completion: { finished in })
        jump2()
    }
    
    func jump2() {
        UIView.animateWithDuration(2,
            animations: {
                
                var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
                self.mario?.center = centerPoint
                self.mario?.center = CGPoint(x: centerPoint.x , y: centerPoint.y * 2 - 46 )
            },
            completion: { finished in })
  
    }

    func gameOver () {
        
        var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5 , y: self.view.bounds.size.height * 0.5 )
        mario!.stopAnimating()
        mario?.image = UIImage(named: "9.png")
        self.mario?.center = CGPoint(x: centerPoint.x , y: centerPoint.y * 2 - 30)
//        self.mario?.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
        
        
    }
    
    func startgame() -> Bool {
        var centerPoint = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
        if abs(Float(box4!.center.x - centerPoint.x * 0.5)) < 35 && Float(box4!.center.y - mario!.center.y) < 55 {
            return false
        }
        if abs(Float(box3!.center.x - centerPoint.x * 0.5)) < 35 && Float(box3!.center.y - mario!.center.y) < 55 {
            return false
        }
        if abs(Float(box2!.center.x - centerPoint.x * 0.5)) < 35 && abs(Float(mario!.center.y - box2!.center.y)) < 215 {
            return false
        }
        if abs(Float(box1!.center.x - centerPoint.x * 0.5)) < 35 && Float(box1!.center.y - mario!.center.y) < 235 {
            return false
        }
            return true
    }
    
    func tapOnMario() {
        //println("tap")
        if startgame() == false {
            self.gameOver()
        }
      
        self.jump1()
    
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        _timer?.invalidate()
        _timer = nil
    }
}
