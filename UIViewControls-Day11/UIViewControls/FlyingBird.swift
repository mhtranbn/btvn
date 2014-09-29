//
//  FlyingBird.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 9/24/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class FlyingBird: UIViewController {
    var bird, tree: UIImageView?  //Biến kiểu optional có chấm hỏi
    func move () {
                var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
                self.bird?.center = CGPoint(x: 0, y: centerPoint.y)
                self.bird?.alpha = 1
                move2()
    }
        func move2() {
        UIView.animateWithDuration(5,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
                //var delta = 80
                self.bird?.animationRepeatCount = -1  //Forever loop
                self.bird?.animationDuration = 1  //khoảng thời gian chạy animation
                self.bird?.center = CGPoint(x: centerPoint.x - 80, y: centerPoint.y)
                self.bird?.alpha = 1
            },
            completion: { finished in
                self.move3()
        })        
    }
    
    func move3() {
        UIView.animateWithDuration(5,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
                self.bird?.center = CGPoint(x: centerPoint.x - 80 , y: centerPoint.y - 80)
                self.bird?.alpha = 1
            },
            completion: { finished in
                self.move4()
        })
    }
    
    func move4() {
        UIView.animateWithDuration(5,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
                self.bird?.center = CGPoint(x: centerPoint.x + 80, y: centerPoint.y - 80)
                self.bird?.alpha = 1
            },
            completion: { finished in
                self.move5()
        })
    }
    func move5() {
        UIView.animateWithDuration(5,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
                self.bird?.center = CGPoint(x: centerPoint.x + 80, y: centerPoint.y + 80 )
                self.bird?.alpha = 1
            },
            completion: { finished in
                self.move6()
        })
    }
    func move6() {
        UIView.animateWithDuration(5,
            animations: {
                var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
                self.bird?.center = CGPoint(x: centerPoint.x * 2 + 100, y: centerPoint.y + 80 )
                self.bird?.alpha = 1
            },
            completion: { finished in })
    }
    
    func treeShow() {
        var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
        tree?.center = centerPoint
        tree!.image = UIImage(named: "tree.jpg")
        self.tree?.center = CGPoint(x: centerPoint.x , y: centerPoint.y )

    }
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        tree = UIImageView(frame: CGRect(x: 10, y: 240, width: 100, height: 200))
        bird = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 26))
        bird?.animationImages = [
            UIImage(named: "bird0.png"),
            UIImage(named: "bird1.png"),
            UIImage(named: "bird2.png"),
            UIImage(named: "bird3.png"),
            UIImage(named: "bird4.png"),
            UIImage(named: "bird5.png")
        ]
        self.view.addSubview(tree!)
        self.view.addSubview(bird!)
        self.edgesForExtendedLayout = UIRectEdge.None
        self.treeShow()
        self.move()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bird?.startAnimating()
        
            }
}
