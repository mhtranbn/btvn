//
//  MenuVC.swift
//  ParisGateuax
//
//  Created by mhtran on 11/3/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit
import AVFoundation

class MenuVC: UIViewController {

    var audioPlayer = AVAudioPlayer()
    override func loadView() {
        super.loadView()
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Audiobackground()
        self.view.backgroundColor = UIColor.whiteColor()
        var background = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        background.image = UIImage(named: "back.jpg")
        self.view.addSubview(background)
        self.title = "Paris Gateaux"

       

        //birthday
        var button1 = UIButton()
        button1 = UIButton(frame: CGRectMake(20, 30, 60, 60))
        var imageb1 = UIImage(named: "birthdayCake.png") as UIImage!
        button1.setBackgroundImage(imageb1, forState: .Normal)
        button1.addTarget(self, action: "onTap", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button1)
        
        
        var labelb1: UILabel = UILabel()
        labelb1 = UILabel(frame: CGRect(x: 25, y: 50, width: 100, height: 100))
        labelb1.text = NSString(UTF8String: "Birthday")
        labelb1.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        labelb1.font = UIFont(name:labelb1.font.fontName, size: 12)
        self.view.addSubview(labelb1)
        //bread
        var button2 = UIButton()
        button2 = UIButton(frame: CGRectMake(125, 30, 60, 60))
        var imageb2 = UIImage(named: "muffin.png") as UIImage!
        button2.setBackgroundImage(imageb2, forState: .Normal)
        button2.addTarget(self, action: "onTap", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button2)
        
        var labelb2: UILabel = UILabel()
        labelb2 = UILabel(frame: CGRect(x: 140, y: 50, width: 100, height: 100))
        labelb2.text = NSString(UTF8String: "Bread")
        labelb2.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        labelb2.font = UIFont(name: labelb2.font.fontName, size: 12)
        self.view.addSubview(labelb2)
        
        //Drink
        var button3 = UIButton()
        button3 = UIButton(frame: CGRectMake(235, 30, 60, 60))
        var imageb3 = UIImage(named: "coffee-cup.png") as UIImage!
        button3.setBackgroundImage(imageb3, forState: .Normal)
        button3.addTarget(self, action: "onTap", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button3)
        
        var labelb3: UILabel = UILabel()
        labelb3 = UILabel(frame: CGRect(x: 255, y: 50, width: 100, height: 100))
        labelb3.text = NSString(UTF8String: "Drink")
        labelb3.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        labelb3.font = UIFont(name: labelb3.font.fontName, size: 12)
        self.view.addSubview(labelb3)
        
        //Ice Cream
        var button4 = UIButton()
        button4 = UIButton(frame: CGRectMake(20, 130, 60, 60))
        var imageb4 = UIImage(named: "iceCream.png") as UIImage!
        button4.setBackgroundImage(imageb4, forState: .Normal)
        button4.addTarget(self, action: "onTap", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button4)
        
        var labelb4: UILabel = UILabel()
        labelb4 = UILabel(frame: CGRect(x: 25, y: 150, width: 100, height: 100))
        labelb4.text = NSString(UTF8String: "IceCream")
        labelb4.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        labelb4.font = UIFont(name: labelb4.font.fontName, size: 12)
        self.view.addSubview(labelb4)
        //COOKIES
        var button5 = UIButton()
        button5 = UIButton(frame: CGRectMake(125, 130, 60, 60))
        var imageb5 = UIImage(named: "cookies.png") as UIImage!
        button5.setBackgroundImage(imageb5, forState: .Normal)
        button5.addTarget(self, action: "onTap", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button5)
        
        var labelb5: UILabel = UILabel()
        labelb5 = UILabel(frame: CGRect(x: 130, y: 150, width: 100, height: 100))
        labelb5.text = NSString(UTF8String: "Cookies")
        labelb5.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        labelb5.font = UIFont(name: labelb5.font.fontName, size: 12)
        self.view.addSubview(labelb5)
        
        //ParisGateuax
        var imagePa = UIImageView(frame: CGRect(x: 25, y: 250, width: self.view.bounds.size.width - 50, height: 130))
        imagePa.image = UIImage(named: "ParisGateuax.png")
        self.view.addSubview(imagePa)
        
//         func preferredStatusBarStyle() -> UIStatusBarStyle {
//            return UIStatusBarStyle.LightContent
        
        
//    }
    
    }
    func Audiobackground() {
        var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("background", ofType: ".mp3")!)
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        var error: NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }
    
    //    func onTap() {
    //        let storyBoard = UIStoryboard(name: "Parisgateuax", bundle: nil)
    //        let helloWorldVC: AnyObject! = storyBoard.instantiateInitialViewController()
    //        self.presentViewController(helloWorldVC as UIViewController, animated: true) { () -> Void in
    //        }
    //    }
    
    
    
}
