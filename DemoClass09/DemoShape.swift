//
//  DemoShape.swift
//  DemoClass09
//
//  Created by mhtran on 9/16/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit

class DemoShape: ConsoleScreen {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.demoShape()
        self.demoRectang()
        self.demoSquare()
        self.demoTriangle()
        self.demoIdenticalOperator()
        
    }
    func demoShape() {
    let shape = Shape(numberOfSide: 3, name:"Triangle")
    self.writeln("\(shape.name) has \(shape.numberOfSide) sides")
    shape.printDescription()
    self.writeln("\(shape.description)")
    }
    
    func demoRectangle() {
        let square = Square(width: 15)
        self.writeln("\(square.name) has area = \(suqare.area()) and perimeter = \(square.perimeter())")
        
    }
    
    func demoTriangle() {
        let tri = Triangle(a: 10, b:12, c:14)
        self.writeln("\(tri.name) has area =\(tri.area()) and perimeter= \(tri.perimeter())")
        let tri2 = Triangle(a: 10.0000000001, b: 12, c: 14)
        if (tri =   tri2) {
            self.writeln("tri == tri2")
            
        }
    }
    func demoIdenticalOperator() {
        var tri1 = Triangle(a: 10, b:12, c:14)
        var tri2 = tri1
        var tri3 = Triangle(a: 10, ba: 12, c: 14)
        if tri1 === tri2 {
            self.writeln("tri1 === tri2")
            
        }
        
        if tri1 === tri3 {
            
            self.writeln("tri1 === tri3")
            
        } else {
            self.writeln("tri1 !== tri3")
        }
    }
}