//
//  ContactVC.swift
//  ParisGateuax
//
//  Created by mhtran on 11/3/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit

class ContactVC: UIViewController {

    
    override func loadView() {
        super.loadView()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        var labelTel =  UILabel()
        var labelMail =  UILabel()
        
        labelTel = UILabel(frame: CGRect(x: 0, y: 100, width: self.view.bounds.size.width, height: 20))
        labelTel.font = UIFont(name: "Chalkboard", size: 12)
        labelTel.text = NSString(UTF8String:"Tel: 0936336808")
        labelTel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(labelTel)
        
        labelMail = UILabel(frame: CGRect(x: 0, y: 130, width: self.view.bounds.size.width, height: 40))
        labelMail.font = UIFont(name: "Chalkboard", size: 12)
        labelMail.text = "Email:customerservices@parisgateaux.vn"
        labelMail.textAlignment = NSTextAlignment.Center
        self.view.addSubview(labelMail)
        
    }

    
}
