//
//  DemoDictionary.swift
//  DemoClass
//
//  Created by techmaster on 9/11/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DemoDictionary: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.declareDic()
    }
    
    func declareDic() {
        var ageOfPeople = [String: Int]()
        ageOfPeople["Steve Jobs"] = 58
        ageOfPeople["Bill Gates"] = 80
        ageOfPeople["God"] = 10000000
        if let ageOfGod = ageOfPeople["God"] {
            self.writeln("Age of God is \(ageOfGod)")
        }
        //Luôn dùng cách này để tránh ứng dụng bị crash vì nill
        if let ageOfJesus = ageOfPeople["Jesus"] {
            self.writeln("Age of Jesus is \(ageOfJesus)")
        }
    }
    
    func objCDic() {
        var objDic : NSDictionary
        objDic = ["rec": Rectangle(width: 10, height: 10),
            "triangle": Triangle(a: 10, b: 10, c: 10),
            "circle": Circle(radius: 10)
        ]
        if let circle: AnyObject = objDic["circle"] {
            if circle is Circle {
                self.writeln("circle = \(circle)")
            }
        }
    }
   
}
