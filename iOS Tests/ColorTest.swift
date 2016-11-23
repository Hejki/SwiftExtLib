//
//  iOS_Tests.swift
//  iOS Tests
//
//  Created by Hejki on 13.08.15.
//
//

import UIKit
import XCTest
@testable import HejkiSwiftCore

class ColorTest: XCTestCase {
    
    func testCreate() {
        XCTAssertEqual(UIColor(red: 0, green: 0, blue: 0, alpha: 1.0), UIColor(hex: 0x000000))
        XCTAssertEqual(UIColor(red: 1, green: 1, blue: 1, alpha: 1.0), UIColor(hex: 0xFFFFFF))
        XCTAssertEqual(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), UIColor(hex: 0xFF0000))
        XCTAssertEqual(UIColor(red: 0, green: 1, blue: 0, alpha: 1.0), UIColor(hex: 0x00FF00))
        XCTAssertEqual(UIColor(red: 0, green: 0, blue: 1, alpha: 1.0), UIColor(hex: 0x0000FF))
        XCTAssertEqual(UIColor(red: 0.2, green: 0.6, blue: 0.8, alpha: 0.5), UIColor(hex: 0x3399CC, alpha: 0.5))
    }
    
    func testHexString() {
        XCTAssertEqual("F0F8FF", UIColor.init(named: .aliceBlue).hexString())
        XCTAssertEqual("F0F8FFCC", UIColor.init(hex: 0xF0F8FF, alpha: 0.8).hexString())
    }
    
    func testCreateWithHexString() {
        XCTAssertEqual(UIColor(red: 0, green: 0, blue: 0, alpha: 1.0), UIColor(hexString: "#000000"))
        XCTAssertEqual(UIColor(red: 1, green: 1, blue: 1, alpha: 1.0), UIColor(hexString: "FFFFFF"))
        XCTAssertEqual(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), UIColor(hexString: "#FF0000"))
        XCTAssertEqual(UIColor(red: 0.2, green: 0.6, blue: 0.8, alpha: 0.5), UIColor(hexString: "3399CC", alpha: 0.5))
    }
    
    func testCreateWithNamed() {
        XCTAssertEqual(UIColor(red: 0, green: 0, blue: 0, alpha: 1.0), UIColor(named: .black))
        XCTAssertEqual(UIColor(red: 1, green: 1, blue: 1, alpha: 1.0), UIColor(named: .white))
        XCTAssertEqual(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), UIColor(named: .red))
    }
}
