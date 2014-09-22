//
//  DemoArray.swift
//  DemoClass
//
//  Created by techmaster on 9/11/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DemoArray: ConsoleScreen {
    var instantArray : NSArray? //? để biểu thị optional
    override func viewDidLoad() {
        super.viewDidLoad()
        self.declareArray()

    }
    
    func declareArray() {
        var intArr = [Int]()
        intArr.append(10)
        intArr.append(100)
        intArr.insert(50, atIndex: 1)
        var objArray : NSArray
        objArray = [Rectangle(width: 10, height: 10), Triangle(a: 10, b: 10, c: 10), Square(width: 4), Circle(radius: 2)]
        
        var swiftArray = [AnyObject]()
        swiftArray.append(Rectangle(width: 10, height: 10))
        swiftArray.append(Triangle(a: 10, b: 10, c: 10))
        swiftArray.append(Square(width: 4))
        swiftArray.append(Circle(radius: 2))
        
        instantArray = objArray
        
        var objMutableArr : NSMutableArray
        objMutableArr = NSMutableArray(capacity: 2)
        objMutableArr.addObject(Rectangle(width: 10, height: 10))
        
        let aTriangle = Triangle(a: 10, b: 10, c: 10)
        objMutableArr.addObject(aTriangle)
        objMutableArr.addObject(Square(width: 4))
        objMutableArr.addObject(Circle(radius: 2))
        
        
        for obj in objMutableArr  {
            if obj is Shape {
                let shape = obj as Shape
                self.writeln("\(shape.description) with perimeter is \(shape.perimeter())")
            }
        }
        
        if objMutableArr.containsObject(aTriangle) {
            self.writeln("YES")
        }
        
        let index: Int = objMutableArr.indexOfObjectIdenticalTo(Triangle(a: 10, b: 10, c: 10))
        if index == Int.max {
            self.writeln("Cannot find identical triangle")
        }
        
        let index2 = objMutableArr.indexOfObjectIdenticalTo(aTriangle)
        self.writeln("found index = \(index2)")
    }
}
