//
//  BootLogic.swift
//  TechmasterSwiftApp
//
//  Created by Adam on 9/8/14.
//  Copyright (c) 2014 Adam. All rights reserved.
//  Techmaster Vietnam

import UIKit
let SECTION = "section"
let MENU = "menu"
let TITLE = "title"
let CLASS = "class"
class BootLogic: NSObject {
    
    var menu : NSArray!
    class func boot(window:UIWindow){
        let mainScreen = MainScreen(style: UITableViewStyle.Grouped)
        
        var basic = [SECTION: "Object Oriented",MENU:[
            [TITLE: "Demo Shape",CLASS: "DemoShape"],
            [TITLE: "Polymorphism",CLASS: "DemoPolymorphism"]]
        ]
        var intermediate = [SECTION: "Collection",MENU: [
            [TITLE: "Array",CLASS: "DemoArray"],
            [TITLE: "Dictionary",CLASS: "DemoDictionary"],
            [TITLE: "Manipulate Array",CLASS: "ManipulateArray"],
            [TITLE: "Sort Array",CLASS: "ManualSort"]
            ]
        ]
        var Codecapm = [SECTION: "Code camp 1",MENU:[
            [TITLE: "Exercise1",CLASS: "Exercise1"],
            [TITLE: "Exersice2",CLASS: "Exersice2"]]
        ]

        var advanced = [SECTION: "Advanced", MENU:[[TITLE: "Advanced C",CLASS:"AdvancedC"]]]
        
        mainScreen.menu = [Codecapm, basic, intermediate, advanced]
        mainScreen.title = "IOS Swift"
        mainScreen.about = "Đây là ứng dụng minh hoạ tính năng ngôn ngữ iOS Swift"
        
        let nav = UINavigationController(rootViewController: mainScreen)
        
        window.rootViewController = nav        
      
    }   
}
