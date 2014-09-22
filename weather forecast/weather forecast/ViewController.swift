//
//  ViewController.swift
//  weather forecast
//
//  Created by mhtran on 8/31/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var location: UILabel!
 
    @IBOutlet weak var temp: UILabel!
    
    @IBOutlet weak var weather: UIImageView!
    //var Suny: UIImage
    
    @IBOutlet weak var quota: UILabel!
    
    @IBAction func update(sender: AnyObject) {
        
    //let imageView = UIImageView(frame: CGRectMake(100, 150, 150, 150))
        

        let imageIndex = arc4random_uniform(UInt32(imagefull.count))
        var image = UIImage(named: imagefull[Int(imageIndex)])
        self.weather.image = image
        
        
        let quotaIndex = arc4random_uniform(UInt32(quotafull.count))
        
        self.quota.text = quotafull[Int(quotaIndex)]
        println("\(quotaIndex)")
        
        let locationIndex = arc4random_uniform(UInt32(locationfull.count))
        
        self.location.text = locationfull[Int(quotaIndex)]
        println("\(locationIndex)")
        
        
        let Temp =  NSString(format: "%2.1f", getTemperature())
        temp.text = "\(Temp)"
        
        
    }
    
    func getTemperature() -> Float {
        
        return 14.0 + Float(arc4random_uniform(18)) + Float(arc4random()) / Float(UINT32_MAX)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    let quotafull = ["Dù ai nói ngả nói nghiêng, lòng tôi vẫn vững như kiềng ba chân.", "Your features in your hands. ", "No pain no gain.", "Cần cù bù thông minh. ", "Có công mài sắt có ngày nên kim. "]
    
    let locationfull = ["NewYork,USA. ", "Paris, French. ", "Hà Nội, Việt Nam .", "Seul,Hàn Quốc", "Tokyo, JaPan", "Kualalamper, Malaysia", "Phnompenh, Campuchia"]

    let imagefull = ["Sunny.png","rain.png","thunder.png","windy.png"]




}

