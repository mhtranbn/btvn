//
//  Circle.swift
//  DemoClass09
//
//  Created by mhtran on 9/16/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import Foundation
class Circle : Shape {
    var radius : Double
    init (radius: Double) {
        self.radius = radius
        super.init(numberOfSides:0 , name: "Circle")
    }
    
    override func perimeter() -> Double {
        return 2 * M_PI * self.radius
    }
    
    override func are() -> Double {
        return self.radius * self.radius * M_PI
    }
}