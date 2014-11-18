//
//  DetailBith.swift
//  ParisGateuax
//
//  Created by mhtran on 11/17/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit

class DetailBith: UIViewController, UIScrollViewDelegate {
    
    var imageCenter: UIImageView?
    var textView: UITextView!
    var buy, add: UIButton!
    var data: DetailStr?
    
    init(data:DetailStr)
    {
        
        super.init(nibName: nil, bundle: nil);
        self.data = data

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    override func loadView() {
        super.loadView()


        self.edgesForExtendedLayout = UIRectEdge.None
        var centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
        
        imageCenter = UIImageView(frame:CGRect(x: 0, y: 0, width: 2 * centerPoint.x - 120, height: 2 * centerPoint.x - 120))
        imageCenter?.center = CGPoint(x: centerPoint.x , y: imageCenter!.bounds.height / 2 )
    
    
        imageCenter?.image = UIImage(named: data!.imagePath)
        NSLog("")
        self.view.addSubview(imageCenter!)
        textView = UITextView(frame: CGRect(x: 30, y: 220, width: centerPoint.x * 2 - 60, height: centerPoint.y - 150))
        textView.text = data!.detail
        textView.editable = false
        textView.selectable = true
        textView.font = UIFont(name: "Zapfino", size: 11)
        self.view.addSubview(textView)
        var scroolPoint: CGPoint = self.textView.contentOffset
        self.textView.setContentOffset(scroolPoint, animated: false)
  
//        buy = UIButton()
//        buy = UIButton(frame: CGRectMake(30, centerPoint.y * 2 - 25, 100, 50))
//        buy.setTitle("Buy It Now", forState: .Normal)
//        buy.setTitleColor(UIColor.blueColor(), forState: .Normal)
//        buy.addTarget(self, action: "Buy", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(buy)
        var buy = UIButton()
        buy = UIButton(frame: CGRectMake(20, 370, 150, 60))
        buy.setTitle("Buy It Now", forState: .Normal)
        buy.setTitleColor(UIColor.blueColor(), forState: .Normal)
        buy.addTarget(self, action: "Buy", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buy)
        
        var add = UIButton()
        add = UIButton(frame: CGRectMake(160, 370, 150, 60))
        add.setTitle("Add To Cart", forState: .Normal)
        add.setTitleColor(UIColor.blueColor(), forState: .Normal)
        add.addTarget(self, action: "Add", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(add)
        
    }

    func Buy() {
        var alertView = UIAlertView()
        alertView.addButtonWithTitle("YES")
        alertView.addButtonWithTitle("NO")
        alertView.title = "Confirm"
        alertView.message = "Bạn chắc chắn muốn mua loại này?"
        alertView.show()
    }
    func Add() {
        var alertView = UIAlertView()
        alertView.addButtonWithTitle("YES")
        alertView.addButtonWithTitle("NO")
        alertView.title = "Confirm"
        alertView.message = "Bạn chắc chắn muốn cho loại này vào giỏ hàng? "
        alertView.show()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
       

    }

    

    
}
