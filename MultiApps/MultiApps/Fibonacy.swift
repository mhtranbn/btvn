//
//  Fibonacy.swift
//  MultiApps
//
//  Created by mhtran on 9/2/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit

class Fibonacy: UIViewController {

    @IBOutlet weak var numberA: UITextField!
    @IBOutlet weak var Display: UILabel!
    func CreatFibonacci (number: Int) -> [Int64] {
        
        var result: [Int64] = Array(count: number, repeatedValue: 0)
        result[1] = 1
        for var i = 2; i < number; i++ {
            
            result[i] = result[i-1] + result[i-2]
        }
        
        return result
    }
    @IBAction func CreatFibo(sender: AnyObject) {
        
       if let a = self.numberA.text.toInt(){
        var result = self.CreatFibonacci(a)
        var string = ""
        for i in 0..<a {
        
        string += "\(result[i]),"
            
        }
        
        
        self.Display.text = string
        
        
        
        
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
}



