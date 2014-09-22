//
//  Exersice2.swift
//  DemoClass
//
//  Created by mhtran on 9/19/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class Exersice2: ConsoleScreen {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Sort()
    }
    func Sort() {
        var array : [Int] = [ 2, 5 , 7, 2, 5 ,6, 3, 8, 2 , 8, 6, 6 ,6 , 3]
        writeln("Mang dau vao la:\n\(array) \nMang dau ra la: \n\(array.arrayCompare())")
    }
    
}

extension Array {
    func arrayCompare () -> [Int] {
        var arrayNew: [Int] = [self[0] as Int]
        for i in 1...self.count-1 {
            if !contains(arrayNew, self[i] as Int)  {
                arrayNew.append(self[i] as Int)
            }
        }
    return arrayNew
    }
}