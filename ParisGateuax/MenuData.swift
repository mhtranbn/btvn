//
//  MenuData.swift
//  ParisGateuax
//
//  Created by mhtran on 11/18/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import Foundation
class MenuData {
    var category: String
    
    var detailData = Array<DetailStr>()
    init(category: String) {
        self.category = category
        
    }
    
    func addData(title: String, price: String, imagePath: String, detail: String = "") {
        NSLog("")
        detailData.append(DetailStr(title: title, price: price, imagePath: imagePath, detail: detail))
    }
        
}