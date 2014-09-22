//
//  DemoPolymorphism.swift
//  DemoClass09
//
//  Created by mhtran on 9/16/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import Foundation

class DemoPolymorphism: ConsoleScreen {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.demoPoly()
    }
    
    func demoPoly() {
        let rec = Rectangle(width: 10, heght: 20)
        let square = Square(width: 5)
        let cir = Circle(radius: 6)
        let tri = Triangle(a: 10, b: 12, c: 13.5)
        let shapes = [rec, square, cir, tri ]
        for shape in shapes {
            self.writeln("\(shape.name) has area = \(shape.are()) and perimeter = \(shape.perimeter())\n")
        }
    }
}