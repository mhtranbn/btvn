//
//  GiaiPTB2ViewController.swift
//  MultiApps
//
//  Created by mhtran on 9/1/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit

class GiaiPTB2ViewController: UIViewController {

    @IBOutlet weak var numberA: UITextField!
    
    @IBOutlet weak var numberB: UITextField!
    
    @IBOutlet weak var numberC: UITextField!
    
    
    @IBOutlet weak var X1: UITextField!
    
    @IBOutlet weak var X2: UITextField!
    
    @IBOutlet weak var ThongBao: UITextField!
    
    @IBAction func Tinh(sender: AnyObject) {
        
        var a = self.numberA.text.toInt()
        var b = self.numberB.text.toInt()
        var c = self.numberC.text.toInt()
        
        var delta :Float
        delta = Float((b! * b!) - (4 * a! * c!))
        if delta >= 0 {
        
            let t = sqrt(delta)
            var x1, x2 :Float
            x1 = 0.5 * ( Float(-b!) + t )
            x2 = 0.5 * ( Float(-b!) - t )
            self.ThongBao.text = ""
            self.ThongBao.text = "Phương trình có 2 nghiệm"
            self.X1.text = "\(x1)"
            
            self.X2.text = "\(x2)"
                if delta == 0 {
                    self.ThongBao.text = "Phương trình có nghiệm kép"
            }
                //else {self.ThongBao.text = ""}
        }
            
        else {
        
            self.X1.text = ""
            self.X2.text = ""
            self.ThongBao.text = "Phương trình vô nghiệm"
        }
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    

    
}
