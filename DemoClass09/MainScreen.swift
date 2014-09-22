//
//  MainScreen.swift
//  DemoClass09
//
//  Created by mhtran on 9/16/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit
class MainScreen: UITableViewController{
    var description1:NSString!
    var about:NSString{
        get{
            return description1
        }
        set (about) {
            self.description1 = NSString(format: "%@\n\n%@", about,"Written by Techmaster Vietnam")
        }
    }
    var menu:NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        var barButoonItem = UIBarButtonItem(title: "About", style: UIBarButtonItemStyle.Plain, target: self, action: "onAbout")
        self.navigationItem.rightBarButtonItem = barButoonItem
    }
    func onAbout(){
        var aler = UIAlertView(title: "About", message: self.about, delegate: self, cancelButtonTitle: "Thank")
        aler.show()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return menu.count
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        var menuSection = self.menu[section] as NSDictionary
        var menuArray = menuSection[MENU] as NSArray
        
        return menuArray.count
    }
    
    override func tableView(tableView: UITableView!, titleForFooterInSection section: Int) -> String? {
        var menuSection = self.menu[section] as NSDictionary
        return menuSection[SECTION] as NSString
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        var menuSection = self.menu[indexPath.section] as NSDictionary
        var menuItems = menuSection[MENU] as NSArray
        var item = menuItems[indexPath.row] as NSDictionary
        cell.textLabel!.text = item[TITLE] as NSString
        return cell
    }
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var menuSection = self.menu[indexPath.section] as NSDictionary
        var menuItems = menuSection[MENU] as NSArray
        var item = menuItems[indexPath.row] as NSDictionary
        var xibClass = item[CLASS] as NSString
        var detailScreen: UIViewController!
        
        if let aClass = NSClassFromString("DemoClass.\(xibClass)") as? UIViewController.Type{
            if (NSBundle.mainBundle().pathForResource(xibClass, ofType: "nib") == nil){
                detailScreen = aClass() as UIViewController
            }else{
                detailScreen = aClass(nibName: xibClass, bundle: nil) as UIViewController
            }
            detailScreen.title = item[TITLE] as? String
            self.navigationController!.pushViewController(detailScreen, animated: true)
        }else{
            var aler = UIAlertView(title: "warning", message: "Please implement screen \(xibClass)", delegate: nil, cancelButtonTitle: "OK")
            aler.show()
        }
    }
}
