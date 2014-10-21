//
//  FoureEdge.swift
//  DemoAdaptiveLayout
//
//  Created by mhtran on 10/17/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class FoureEdge: UIViewController {
    var rect1 : UILabel?
    var rect2 : UILabel?
    var rect3 : UILabel?
    var rect4 : UILabel?
    //portrain
    var c1, c2, c3, c4, c5  : [AnyObject]?
    var co1, co2, co3, co4, co5, co6  : NSLayoutConstraint?
    //lanscape
    var c_1, c_2, c_3, c_4, c_5 : [AnyObject]?
    var co_1, co_2, co_3, co_4, co_5, co_6 : NSLayoutConstraint?
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        rect1 = UILabel()
        rect2 = UILabel()
        rect3 = UILabel()
        rect4 = UILabel()
        rect1!.backgroundColor = UIColor.yellowColor()
        rect2!.backgroundColor = UIColor.redColor()
        rect3!.backgroundColor = UIColor.greenColor()
        rect4!.backgroundColor = UIColor.blackColor()
        self.view.addSubview(rect1!)
        self.view.addSubview(rect2!)
        self.view.addSubview(rect3!)
        self.view.addSubview(rect4!)
        rect1!.setTranslatesAutoresizingMaskIntoConstraints(false)
        rect2!.setTranslatesAutoresizingMaskIntoConstraints(false)
        rect3!.setTranslatesAutoresizingMaskIntoConstraints(false)
        rect4!.setTranslatesAutoresizingMaskIntoConstraints(false)
        portrainContrains()
        lanscapeContrains()
        toogeContrains(true)
    }
    
    func portrainContrains() {
        let views = ["view": self.view, "rect1": rect1!, "rect2": rect2!, "rect3": rect3!, "rect4": rect4!]
        
         // rect1 cach bottom, rect2, rect3, rect4 20
        c1 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-20.0-[rect1]-20.0-[rect2]-20.0-[rect3]-20.0-[rect4]-20.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c1!)
        
        //rect1 cach left,right 20
        c2 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20.0-[rect1]-20.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c2!)
        
        //rect2 cach left,right 20
        c3 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20.0-[rect2]-20.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c3!)
        
        //rect3 cach left,right 20
        c4 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20.0-[rect3]-20.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c4!)
        
        //rect4 cach left,right 20
        c5 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20.0-[rect4]-20.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c5!)

        // Height rect1 = 3 rect2
        co1 = NSLayoutConstraint(item: rect1!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: rect2!, attribute: NSLayoutAttribute.Height, multiplier: 3, constant: 0)
        self.view.addConstraint(co1!)
        
        //width rect1  = rect2
        co2 = NSLayoutConstraint(item: rect2!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: rect1!, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        self.view.addConstraint(co2!)
        
        //width rect3  = rect2
        co3 = NSLayoutConstraint(item: rect3!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: rect2!, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        self.view.addConstraint(co3!)
        
        // Height rect3 = rect2
        co5 = NSLayoutConstraint(item: rect3!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: rect2!, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        self.view.addConstraint(co5!)
        
        //width rect 4  = rect 3
        co4 = NSLayoutConstraint(item: rect4!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: rect3!, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        self.view.addConstraint(co4!)
        
        // Height rect4 = rect3
        co6 = NSLayoutConstraint(item: rect4!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: rect3!, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        self.view.addConstraint(co6!)
        
    }
    
       func toogeContrains(portrains: Bool) {
        if portrains {
            //Allways disable contrains first
            NSLayoutConstraint.deactivateConstraints(c_1!)
            NSLayoutConstraint.deactivateConstraints(c_2!)
            NSLayoutConstraint.deactivateConstraints(c_3!)
            NSLayoutConstraint.deactivateConstraints(c_4!)
            NSLayoutConstraint.deactivateConstraints(c_5!)
            
            co_1?.active = false
            co_2?.active = false
            co_3?.active = false
            co_4?.active = false
            co_5?.active = false
            //then active late 
            NSLayoutConstraint.activateConstraints(c1!)
            NSLayoutConstraint.activateConstraints(c2!)
            NSLayoutConstraint.activateConstraints(c3!)
            NSLayoutConstraint.activateConstraints(c4!)
            NSLayoutConstraint.activateConstraints(c5!)
            
            co1?.active = true
            co2?.active = true
            co3?.active = true
            co4?.active = true
            co5?.active = true
            co6?.active = true
        } else {
            NSLayoutConstraint.deactivateConstraints(c1!)
            NSLayoutConstraint.deactivateConstraints(c2!)
            NSLayoutConstraint.deactivateConstraints(c3!)
            NSLayoutConstraint.deactivateConstraints(c4!)
            NSLayoutConstraint.deactivateConstraints(c5!)
            
            co1?.active = false
            co2?.active = false
            co3?.active = false
            co4?.active = false
            co5?.active = false
            co6?.active = false
    
            NSLayoutConstraint.activateConstraints(c_1!)
            NSLayoutConstraint.activateConstraints(c_2!)
            NSLayoutConstraint.activateConstraints(c_3!)
            NSLayoutConstraint.activateConstraints(c_4!)
            NSLayoutConstraint.activateConstraints(c_5!)
            co_1?.active = true
            co_2?.active = true
            co_3?.active = true
            co_4?.active = true
            co_5?.active = true
            
        }
    }
    func lanscapeContrains() {
        let views = ["view": self.view, "rect1": rect1!, "rect2": rect2!, "rect3": rect3!, "rect4": rect4!]
        
        //rect1 cach top, bottom 20
        c_1 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-20.0-[rect1]-20.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c_1!)
        
        //rect1 cach left 20, cach rect2 left 20
        c_2 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20.0-[rect1]-20.0-[rect2]-20.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c_2!)
        
        //rect 234 cach nhau 20 vs cah top bottom 20
        c_3 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-20.0-[rect2]-20.0-[rect3]-20.0-[rect4]-20.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c_3!)
        
        c_4 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20.0-[rect1]-20.0-[rect3]-20.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c_4!)
        
        c_5 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20.0-[rect1]-20.0-[rect4]-20.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c_5!)
        
        // Width rect2 = 1.3 rect1
        co_1 = NSLayoutConstraint(item: rect2!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: rect1!, attribute: NSLayoutAttribute.Width, multiplier: 1.3 , constant: 0)
        self.view.addConstraint(co_1!)
        
        // rect234 bang nhau
        co_2 = NSLayoutConstraint(item: rect3!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: rect2!, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        self.view.addConstraint(co_2!)
        
        co_3 = NSLayoutConstraint(item: rect4!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: rect2!, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        self.view.addConstraint(co_3!)
        co_4 = NSLayoutConstraint(item: rect3!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: rect2!, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        self.view.addConstraint(co_4!)
        co_5 = NSLayoutConstraint(item: rect4!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: rect2!, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        self.view.addConstraint(co_5!)
        
        
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()
        let size = self.view.bounds.size
        if size.width < size.height {
           toogeContrains(true)
        } else {
            toogeContrains(false)
        }
        
        
    }
    
}

    


