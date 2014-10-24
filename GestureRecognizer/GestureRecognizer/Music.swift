//
//  Music.swift
//  GestureRecognizer
//
//  Created by mhtran on 10/16/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit
import AVFoundation

class Music: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("emptytrash", ofType: "aif")!)
        println(alertSound)
        
        // Removed deprecated use of AVAudioSessionDelegate protocol
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        
        var error:NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
}
