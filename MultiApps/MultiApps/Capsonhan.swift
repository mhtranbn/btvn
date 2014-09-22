//
//  Capsonhan.swift
//  MultiApps
//
//  Created by mhtran on 9/2/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit
infix operator ^^ {}

func ^^ (radix :Int, power :Int ) -> Int {
    return Int(pow(Double (radix), Double(power)))
}

class Capsonhan: UIViewController {

    @IBOutlet weak var numberA: UITextField!
    @IBOutlet weak var numberB: UITextField!
    @IBOutlet weak var Display: UILabel!
    @IBAction func Caculace(sender: AnyObject) {
     
        //self.Display.text = ""
        if
        let a = self.numberA.text.toInt()
        {if let b = self.numberB.text.toInt()
        
        {
            let t = a ^^ b
            self.Display.text = "\(t)"
        } else {
            
            self.Display.text = "Số nhập không đúng"
            }
        
        }
        else {
        
            self.Display.text = "Số nhập không đúng"
        }
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

   
  
   
}
