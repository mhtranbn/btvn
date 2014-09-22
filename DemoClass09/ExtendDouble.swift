//
//  ExtendDouble.swift
//  DemoClass09
//
//  Created by mhtran on 9/16/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import Foundation

infix operator ~~ {}
func ~~(d1: Double, d2: Double) -> Bool {
    let delta = d1 - d2
    if delta.absolute < 0.00000001 {
        return true
    } else {
        return false
    }
        
}
extension Double {
var absolute: Double {
if self > 0.0 {
return self
}else {
return self
}
}}