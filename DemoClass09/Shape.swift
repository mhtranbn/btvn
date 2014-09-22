//
//  Shape.swift
//  DemoClass09
//
//  Created by mhtran on 9/16/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import Foundation

class Shape {
    var numberOfSides: Int
    var name: String
    init (numberOfSides: Int, name: String) {
        self.numberOfSides = numberOfSides
        self.name = name
    }
    func printDescription() {
        println("\(self.name) has \(self.numberOfSides) sides")
        
    }
    var description: String {
        return "\(self.name) has \(self.numberOfSides) sides"
    }
    
    func perimeter() -> Double {
        return 0.0
    }
    func are() -> Double {
        return 0.0
    }
    
}