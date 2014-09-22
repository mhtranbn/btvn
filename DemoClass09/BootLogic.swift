//
//  BootLogic.swift
//  DemoClass09
//
//  Created by mhtran on 9/14/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit
let SECTION = "section"
let MENU = "menu"
let TITLE = "title"
let CLASS = "class"
class BootLogic: NSObject {
    var menu : NSArray!
    class func boot(window:UIWindow) {
        let mainScreen = MainScreen(style: UITableViewStyle.Grouped)
        var basic = [SECTION: "Object Oriented",MENU:[
            [TITLE: "Demo Shape", CLASS: "DemoShape"],
            [TITLE: "Polymorphism",CLASS: "DemoPolymorphism"]]
        ]
        var intermediate = [SECTION: "Collection",MENU:[
            [TITLE: "Array",CLASS: "DemoArray"],
            [TITLE: "Dictionary",CLASS: "DemoDictionary"],
            [TITLE: "Manipulate Array", CLASS: "ManipulateArray"],
            [TITLE: "Sort Array",CLASS: "ManulSort"]
            ]
        ]
        
        var advanced = [SECTION: "Advanced", MENU:[[TITLE: "Advance C", CLASS: "AdvancedC"]]]
        mainScreen.menu = [basic, intermediate, advanced]
        mainScreen.title = "IOS Swift"
        mainScreen.about = "Đây là ứng dụng minh họa tính năng ngôn ngữ iOS Swift"
        let nav = UINavigationController(rootViewController: mainScreen)
        window.rootViewController = nav
    }
}