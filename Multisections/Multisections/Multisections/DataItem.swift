//
//  DataItem.swift
//  Multisections
//
//  Created by mhtran on 11/7/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import Foundation
import UIKit

class DataItem {
    var title: String = ""
    var data: Array<String> = []
    private var thumbPhoto: UIImage?
    var thumb: UIImage {
        get {
            return thumbPhoto!
        }
    }
    
    init (title: String, data: Array<String>, thumbStr: String) {
        self.title = title
        self.data = data
    }
}
