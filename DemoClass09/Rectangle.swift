//
//  Rectangle.swift
//  DemoClass09
//
//  Created by mhtran on 9/16/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import Foundation
class Rectangle: Shape {
    
    var width, height: Double
    init (width: Double, heght: Double) {
        self.width = width
        self.height = height
        super.init(numberOfSides: 4, name: "Rectangle")
    }
    
    override func perimeter() -> Double {
        return (self.width + self.height)
    }
    
    override func are() -> Double {
        return self.width * self.height
    }
}

class SuperRectangle: Rectangle {
    
}

