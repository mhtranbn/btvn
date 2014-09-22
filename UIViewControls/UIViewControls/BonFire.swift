//
//  BonFire.swift
//  UIViewControls
//
//  Created by techmaster on 9/19/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class BonFire: UIViewController {
    var label : UILabel?
    var fire : UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        fire!.startAnimating()
    }
    
    override func loadView() {
        super.loadView()
       self.view.backgroundColor = UIColor.blackColor()
       self.edgesForExtendedLayout = UIRectEdge.None
       fire = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
        fire?.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
        var images: [UIImage] = [UIImage]()
        for i in 1...17 {
            var fileName: String
            if i < 10 {
                fileName = "campFire0\(i).gif"
            } else {
                fileName = "campFire\(i).gif"
            }
            images.append(UIImage(named: fileName))
            label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
            label!.backgroundColor = UIColor.blackColor()
            label!.text = "Hương ơi, anh yêu em"
            label!.textColor = UIColor.whiteColor()
            UIView.animateWithDuration(5, delay: 2, options: .Repeat, animations: {self.label!.center = CGPoint(x: 500, y: 30)}, completion: {finished in})
            self.view.addSubview(label!)
        }
        fire!.animationImages = images
        fire!.animationDuration = 1
        fire!.animationRepeatCount = 100
        self.view.addSubview(fire!)
    }


}
