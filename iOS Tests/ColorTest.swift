//
//  iOS_Tests.swift
//  iOS Tests
//
//  Created by Hejki on 13.08.15.
//
//

import UIKit
import XCTest

class ColorTest: XCTestCase {
    
    func testCreate() {
        XCTAssertEqual(UIColor(red: 0, green: 0, blue: 0, alpha: 1.0), UIColor(hex: 0x000000))
        XCTAssertEqual(UIColor(red: 1, green: 1, blue: 1, alpha: 1.0), UIColor(hex: 0xFFFFFF))
        XCTAssertEqual(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), UIColor(hex: 0xFF0000))
        XCTAssertEqual(UIColor(red: 0, green: 1, blue: 0, alpha: 1.0), UIColor(hex: 0x00FF00))
        XCTAssertEqual(UIColor(red: 0, green: 0, blue: 1, alpha: 1.0), UIColor(hex: 0x0000FF))
        XCTAssertEqual(UIColor(red: 0.2, green: 0.6, blue: 0.8, alpha: 1.0), UIColor(hex: 0x3399CC))
        XCTAssertEqual(UIColor(red: 0, green: 0, blue: 0, alpha: 1.0), UIColor(named: Colors.Black))
        XCTAssertEqual(UIColor(red: 1, green: 1, blue: 1, alpha: 1.0), UIColor(named: Colors.White))
        XCTAssertEqual(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), UIColor(named: Colors.Red))
    }
}
