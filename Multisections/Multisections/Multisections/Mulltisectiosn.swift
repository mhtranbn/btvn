//
//  Mulltisectiosn.swift
//  Multisections
//
//  Created by mhtran on 11/7/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Mutisections: UIViewController,UITableViewDataSource,  UITableViewDelegate {
    var audioPlayer = AVAudioPlayer()
    var data : Array<DataItem> =  Array<DataItem>()
    var tableView: UITableView?
    
    override func loadView() {
        super.loadView()
        Audiobackground()
        data.append(DataItem(title: "Europe", data: ["France","German","Spain","Russia","United Kingdom"], thumbStr: "Fr.png"))
        data.append(DataItem(title: "America", data: ["United States","Brazil","Mexico"], thumbStr: "Ge.png"))
        data.append(DataItem(title: "Asia", data: ["Vietnam","Singapore","Indonesia","Japan"], thumbStr: "Sp.png"))
        
        
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Grouped)
        
        self.view.addSubview(tableView!)
        tableView!.delegate = self
        tableView!.dataSource = self
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cellID = "id"
        var cell: UITableViewCell
        if let dequeCell: AnyObject = tableView.dequeueReusableCellWithIdentifier(cellID) {
            cell = dequeCell as UITableViewCell
        } else {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        
        let dataItem = data[indexPath.section] as DataItem
        cell.textLabel.text = dataItem.data[indexPath.row]
        return cell
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 100
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let dataItem = data[section] as DataItem
        return dataItem.data.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dataItem = data[section] as DataItem
        return dataItem.title
    }
    
    func Audiobackground() {
        var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("We-Are-The-World", ofType: ".mp3")!)
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        var error: NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }

    
}