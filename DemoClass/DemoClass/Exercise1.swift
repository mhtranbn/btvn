//
//  Exercise1.swift
//  DemoClass
//
//  Created by mhtran on 9/19/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class Exercise1: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.PrintAverage()
        
    }
    func PrintAverage () {
        var A : [Int] = [ 3, 5, 1, 5, 12, 18, 23, 3, 12, 20 ]
        writeln("Gia tri trung binh cua mang la \(A.Average())")

    }
}
    extension Array {
        func Average () -> Double {
            let n: Int = self.count
            var sum: Int = 0
            for i in 0...n {
            sum += i as Int
            }
            return Double(sum) / Double(n)
        }
    }

    
        

