//
//  DataManager.swift
//  DemoTable
//
//
//  Created by mhtranbn on 11/22/14.
//  Copyright (c) 2014 . All rights reserved.
//

import Foundation
class DataManager {
    class var singleton : DataManager {
        struct Static {
            static let instance : DataManager = DataManager()
        }
        return Static.instance
    }
    
    var students : NSMutableArray
    init() {
        students = NSMutableArray(capacity: 20)
    }
    
}