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
    
    var menu : NSArray?
    class func boot(window:UIWindow){
        let mainScreen = MainScreen(style: UITableViewStyle.Grouped)
    
        
        var medium = [SECTION: "Intermediate",MENU:[
            [TITLE: "CRUD",CLASS: "StudentListVC"]
            ]
        ]
        mainScreen.menu = [medium]
        mainScreen.title = "Table View"
        mainScreen.about = "Đây là ứng dụng minh hoạ TableView"
        
        let nav = UINavigationController(rootViewController: mainScreen)
        
        window.rootViewController = nav        
      
    }   
}
