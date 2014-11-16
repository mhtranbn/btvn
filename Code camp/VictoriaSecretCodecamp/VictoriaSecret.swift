//
//  VictoriaSecret.swift
//  VictoriaSecret
//
//  Created by mhtran on 11/16/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit
import AVFoundation
let PHOTO_WIDTH:CGFloat = 150
let PHOTO_HEIGHT:CGFloat = 200
let NUM_PHOTO = 6



class VictoriaSecret: UITableViewController {
    var audioPlayer = AVAudioPlayer()

    let cellID = "#"
    var data = Array<Victoria>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "Vs Model"
        
        var homeButton : UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "mainmenu.png"), landscapeImagePhone: UIImage(named: "mainmenu.png"), style: UIBarButtonItemStyle.Plain, target: self, action: "")
        var logButton : UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "search.png"), landscapeImagePhone: UIImage(named: "search.png"), style: UIBarButtonItemStyle.Plain, target: self, action: "")
        
        self.navigationItem.leftBarButtonItem = homeButton
        self.navigationItem.rightBarButtonItem = logButton
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.translucent = true
        
        self.view.backgroundColor = UIColor(red: 112/255, green: 18/255, blue: 80/255, alpha: 1)
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0, green: 0.0, blue: 0.0, alpha: 0)
        
        let nibCell = UINib(nibName: "VictoriaVC", bundle: nil)
        self.tableView.registerNib(nibCell, forCellReuseIdentifier: cellID)
        initData()

       
         Audiobackground()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func initData() {
        
        data.append(Victoria(title: "Oh my good! Come on", imageScroll: ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"], numberLike: "45", imagePath: "cuong.png"))
        data.append(Victoria(title: "She is beatifull, Hope... her!", imageScroll: ["6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"],numberLike: "30", imagePath: "duyle.png"))
        data.append(Victoria(title: "I want to ... her,VSecret is 1!",imageScroll: ["11.jpg","12.jpg","13.jpg","14.jpg","15.jpg"], numberLike: "50", imagePath: "huaCuong.png"))
        
        
    }

    
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return data.count
    }
    
    func Audiobackground() {
        var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Toixinloiem", ofType: ".mp3")!)
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        var error: NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: VictoriaVC!
        if let dequecell = tableView.dequeueReusableCellWithIdentifier("#", forIndexPath: indexPath) as? VictoriaVC {
            cell = dequecell
        }
        
        let Victoria = data[indexPath.row]
        cell.title.text = Victoria.title
        cell.numberLike.text = Victoria.numberLike
        cell.avata.image = Victoria.image
        cell.avata.layer.masksToBounds = true
        cell.avata.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).CGColor
        var imageSize = 60 as CGFloat
        cell.avata.layer.cornerRadius = imageSize / 2
        cell.avata.layer.borderWidth = 4
        cell.Scroll.delegate = self
        cell.Scroll.contentSize = CGSizeMake(PHOTO_WIDTH * CGFloat(5), PHOTO_HEIGHT)
        cell.Scroll.pagingEnabled = true
        for var i = 0; i < 5 ; i++ {
            var fileName = Victoria.imageScroll[i]
            var image = UIImage(named: fileName)
            var imageView = UIImageView(image: image)
            imageView.frame = CGRectMake(CGFloat(i) * PHOTO_WIDTH, 0, PHOTO_WIDTH, PHOTO_HEIGHT)
            cell.Scroll.addSubview(imageView)
            
            
        }
        

        // Configure the cell...

        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var nav = self.navigationController?.navigationBar
        
        nav?.tintColor = UIColor.whiteColor()
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 270
    }

  

}
