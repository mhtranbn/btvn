//
//  BootLogic.swift
//  TechmasterSwiftApp
//
//  Created by mhtran on 16/3/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit
let SECTION = "section"
let MENU = "menu"
let TITLE = "title"
let CLASS = "class"
class BootLogic: NSObject {
    
    var menu : NSArray!
    class func boot(window:UIWindow){
        let mainScreen = MainScreen(style: UITableViewStyle.Grouped)
  
        var animation = [SECTION: "Animation",MENU:[
            [TITLE: "Mario",CLASS: "Mario"]
            ]
        ]
        
        mainScreen.menu = [ animation]
        mainScreen.title = "UIView - Controls"
        mainScreen.about = "Đây là ứng dụng minh hoạ UIView - Controls"
        
        let nav = UINavigationController(rootViewController: mainScreen)
        
        window.rootViewController = nav        
      
    }   
}
