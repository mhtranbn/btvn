//
//  DemoTap.swift
//  GestureRecognizer
//
//  Created by Trinh Minh Cuong on 10/3/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoTap: UIViewController {
    var grass, ant , ant1 : UIImageView?
    //var _timer : NSTimer?
    
    override func loadView() {
        super.loadView()
        self.edgesForExtendedLayout = UIRectEdge.None
        grass = UIImageView(frame: self.view.bounds)
        grass?.image = UIImage(named: "grass.png")
        self.view.addSubview(grass!)
        let tap = UITapGestureRecognizer(target: self, action: "onTap:")
        self.view.addGestureRecognizer(tap)

    }
    
    func onTap (tap: UITapGestureRecognizer) {
        ant = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 67))
        ant!.image = UIImage(named: "ant.png")
        self.view.addSubview(ant!)
        let point = tap.locationInView(self.view)
        self.ant?.center = CGPoint(x: point.x, y: point.y)
        println("tap at x = \(point.x), y = \(point.y)")
        
        
    }
    
}
