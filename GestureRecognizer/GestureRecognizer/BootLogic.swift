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
        
        var basic = [SECTION: "Basic",MENU:[
            [TITLE: "MusicPlayer",CLASS: "Music"],
            [TITLE: "Tap",CLASS: "DemoTap"],
            [TITLE: "Impossible Rush",CLASS: "DemoImpossible"],
            [TITLE: "Nemrac",CLASS: "DemoNemrac"],
            [TITLE: "Sutbong",CLASS: "DemoSutbong"],
            [TITLE: "Bia",CLASS: "DemoBia"],
            [TITLE: "Pan",CLASS: "DemoPan"],
            [TITLE: "Rotate",CLASS: "DemoRotate"],
            [TITLE: "Swipe",CLASS: "DemoSwipe"],
            [TITLE: "Pinch",CLASS: "DemoPinch"],
            [TITLE: "InteriorDesign",CLASS: "InteriorDesign"],
            [TITLE: "Pinch Rotate",CLASS: "DemoPinchRotate"]
            ]
        ]        
        mainScreen!.menu = [basic]
        mainScreen!.title = "Gesture Recognizer"
        mainScreen!.about = "Gesture Recognizer iOS8"
        
        let nav = UINavigationController(rootViewController: mainScreen!)
        
        window.rootViewController = nav        
      
    }   
}
