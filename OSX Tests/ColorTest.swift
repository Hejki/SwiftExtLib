//
//  OSX_Tests.swift
//  OSX Tests
//
//  Created by Hejki on 13.08.15.
//
//

import Cocoa
import XCTest

class ColorTest: XCTestCase {
    
    func testCreate() {
        XCTAssertEqual(NSColor(red: 0, green: 0, blue: 0, alpha: 1.0), NSColor(hex: 0x000000))
        XCTAssertEqual(NSColor(red: 1, green: 1, blue: 1, alpha: 1.0), NSColor(hex: 0xFFFFFF))
        XCTAssertEqual(NSColor(red: 1, green: 0, blue: 0, alpha: 1.0), NSColor(hex: 0xFF0000))
        XCTAssertEqual(NSColor(red: 0, green: 1, blue: 0, alpha: 1.0), NSColor(hex: 0x00FF00))
        XCTAssertEqual(NSColor(red: 0, green: 0, blue: 1, alpha: 1.0), NSColor(hex: 0x0000FF))
        XCTAssertEqual(NSColor(red: 0.2, green: 0.6, blue: 0.8, alpha: 1.0), NSColor(hex: 0x3399CC))
        XCTAssertEqual(NSColor(red: 0, green: 0, blue: 0, alpha: 1.0), NSColor(named: Colors.Black))
        XCTAssertEqual(NSColor(red: 1, green: 1, blue: 1, alpha: 1.0), NSColor(named: Colors.White))
        XCTAssertEqual(NSColor(red: 1, green: 0, blue: 0, alpha: 1.0), NSColor(named: Colors.Red))
    }
}