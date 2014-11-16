//
//  VictoriaCl.swift
//  VictoriaSecret
//
//  Created by mhtran on 11/16/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import Foundation
import UIKit

class Victoria {
    var title: String
    
    var numberLike: String
    private var _image : UIImage
    var image: UIImage {
        get {
            return _image
        }
    }
    var imageScroll: [String]
    
    init (title: String,imageScroll: [String] ,numberLike: String, imagePath: String) {
        self.title = title
        self.imageScroll = imageScroll
        self.numberLike = numberLike
        _image = UIImage(named: imagePath)!
        
        
    }
    
    
    
}