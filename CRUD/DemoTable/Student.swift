//
//  Student.swift
//  DemoTable
//
//  Created by mhtranbn on 11/22/14.
//  Copyright (c) 2014 . All rights reserved.
//

import Foundation
class Student {
    var fullName: String
    var score: Double
    var liked: Bool
    init (name: String, score: Double = 0.0, liked: Bool = false) {
        fullName = name
        self.score = score
        self.liked = liked
    }
}