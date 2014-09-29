//
//  StarField.swift
//  UIViewControls
//
//  Created by mhtran on 9/28/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class StarField: UIViewController {

    var violet, red, green, brown : UIImageView?
    
    func configureInitialPosition () {
        var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
        violet?.center = centerPoint
        red?.center = centerPoint
        green?.center = centerPoint
        brown?.center =  centerPoint
    }
    
    func move () {
        UIView.animateWithDuration( 1 , animations: {
            var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
            var delta = centerPoint.x * 0.5
            self.violet?.center = CGPoint(x: centerPoint.x - delta, y: centerPoint.y - delta )
            self.violet?.alpha = 1
            self.red?.center = CGPoint(x: centerPoint.x - delta, y: centerPoint.y + delta )
            self.red?.alpha = 1
            self.green?.center = CGPoint(x: centerPoint.x + delta, y: centerPoint.y - delta )
            self.green?.alpha = 1
            self.brown?.center = CGPoint(x: centerPoint.x + delta, y: centerPoint.y + delta )
            self.brown?.alpha = 1
            }, completion: {
                finished in
               self.move2()
        })
        }
    
    func move2() {
        UIView.animateWithDuration( 1 , animations: {
            var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
            var delta = centerPoint.x * 0.5
            self.violet?.center = CGPoint(x: centerPoint.x - delta, y: centerPoint.y )
            self.violet?.alpha = 1
            self.red?.center = CGPoint(x: centerPoint.x, y: centerPoint.y + delta )
            self.red?.alpha = 1
            self.green?.center = CGPoint(x: centerPoint.x, y: centerPoint.y - delta )
            self.green?.alpha = 1
            self.brown?.center = CGPoint(x: centerPoint.x + delta, y: centerPoint.y )
            self.brown?.alpha = 1
            }, completion: {
                finished in
                UIView.animateWithDuration( 1 , animations: {
                    self.configureInitialPosition()
                    },completion: {
                        finished in
                    }
)
        })
    }

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        violet = UIImageView(image: UIImage(named: "violet.png"))
        red = UIImageView(image: UIImage(named: "red.png"))
        green = UIImageView(image: UIImage(named: "green.png"))
        brown = UIImageView(image: UIImage(named: "brown.png"))
        self.view.addSubview(violet!)
        self.view.addSubview(red!)
        self.view.addSubview(green!)
        self.view.addSubview(brown!)
        self.edgesForExtendedLayout = UIRectEdge.None
        self.configureInitialPosition()
        self.move()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    
}
