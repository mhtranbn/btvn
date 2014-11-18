//
//  DetailStr.swift
//  ParisGateuax
//
//  Created by mhtran on 11/17/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import Foundation
import UIKit

class DetailStr {
    var title: String
    var price: String
    var detail: String
    var imagePath: String
    init (title: String, price: String = "", imagePath: String,detail:String = "no detail") {
        self.title = title
        self.price = price
        self.detail = detail
        self.imagePath = imagePath
    }
}