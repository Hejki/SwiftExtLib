//: Playground - noun: a place where people can play

import UIKit
import CoreGraphics

var col = UIColor.white

var col2 = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)

let hex = 0x000000
let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
let blue = CGFloat(hex & 0xFF) / 255.0

col = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
col == col2
