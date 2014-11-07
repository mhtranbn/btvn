//
//  ShopData.swift
//  ParisGateuax
//
//  Created by mhtran on 11/7/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import Foundation
import UIKit

class ShopData {
    var name: String = ""
    private var thumbPhoto: UIImage?
    var thumb: UIImage {
        get {
            return thumbPhoto!
        }
    }
    
    init (name: String, thumbStr: String) {
        self.name = name
        self.thumbPhoto = UIImage(named: thumbStr)
        
    }
}