//
//  Square.swift
//  DemoClass09
//
//  Created by mhtran on 9/16/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import Foundation
class Square : Shape {
    var width: Double
    init (width: Double) {
        self.width = width
        super.init(numberOfSides: 4, name: "Square")
    }
    override func perimeter() -> Double {
        return 4 * width
    }
    override func are() -> Double {
        return width * width
    }
}