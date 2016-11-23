//
//  OSX_Tests.swift
//  OSX Tests
//
//  Created by Hejki on 13.08.15.
//
//

import Cocoa
import XCTest
@testable import HejkiSwiftCore

class ColorTest: XCTestCase {
    
    func testCreate() {
        XCTAssertEqual(NSColor(red: 0, green: 0, blue: 0, alpha: 1.0), NSColor(hex: 0x000000))
        XCTAssertEqual(NSColor(red: 1, green: 1, blue: 1, alpha: 1.0), NSColor(hex: 0xFFFFFF))
        XCTAssertEqual(NSColor(red: 1, green: 0, blue: 0, alpha: 1.0), NSColor(hex: 0xFF0000))
        XCTAssertEqual(NSColor(red: 0, green: 1, blue: 0, alpha: 1.0), NSColor(hex: 0x00FF00))
        XCTAssertEqual(NSColor(red: 0, green: 0, blue: 1, alpha: 1.0), NSColor(hex: 0x0000FF))
        XCTAssertEqual(NSColor(red: 0.2, green: 0.6, blue: 0.8, alpha: 0.5), NSColor(hex: 0x3399CC, alpha: 0.5))
    }
    
    func testHexString() {
        XCTAssertEqual("#ECF6FE", NSColor.init(named: .aliceBlue).hexString()!)
        XCTAssertEqual("#2A86C0CC", NSColor.init(hex: 0x3399CC, alpha: 0.8).hexString(withAlpha: true)!)
    }
    
    func testCreateWithHexString() {
        XCTAssertEqual(NSColor(red: 0, green: 0, blue: 0, alpha: 1.0), NSColor(hexString: "#000000"))
        XCTAssertEqual(NSColor(red: 1, green: 1, blue: 1, alpha: 1.0), NSColor(hexString: "FFFFFF"))
        XCTAssertEqual(NSColor(red: 1, green: 0, blue: 0, alpha: 1.0), NSColor(hexString: "#FF0000"))
        XCTAssertEqual(NSColor(red: 0.2, green: 0.6, blue: 0.8, alpha: 0.5), NSColor(hexString: "3399CC", alpha: 0.5))
    }
    
    func testCreateWithNamed() {
        XCTAssertEqual(NSColor(red: 0, green: 0, blue: 0, alpha: 1.0), NSColor(named: .black))
        XCTAssertEqual(NSColor(red: 1, green: 1, blue: 1, alpha: 1.0), NSColor(named: .white))
        XCTAssertEqual(NSColor(red: 1, green: 0, blue: 0, alpha: 1.0), NSColor(named: .red))
    }
}
