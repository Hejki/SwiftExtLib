//
//  CGOperatorsTest.swift
//  SwiftExtensionsLib
//
//  Created by Hejki on 10.12.15.
//
//

import XCTest
@testable import HejkiSwiftCore

class CGOperators: XCTestCase {
    let left = CGPoint(x: 10, y: 2)
    let right = CGPoint(x: 5, y: 2.4)
    
    func plus() {
        let result = left + right
        
        XCTAssertEqual(15, result.x)
        XCTAssertEqual(4.4, result.y)
    }
    
    func minus() {
        let result = left - right
        let result2 = right - left
        
        XCTAssertEqual(5, result.x)
        XCTAssertEqual(-0.4, result.y)
        XCTAssertEqual(-5, result2.x)
        XCTAssertEqual(0.4, result2.y)
    }
    
    func plusEq() {
        var result = left

        result += right
        
        XCTAssertEqual(15, result.x)
        XCTAssertEqual(4.4, result.y)
    }
    
    func minusEq() {
        var result = left
        
        result -= right
        
        XCTAssertEqual(5, result.x)
        XCTAssertEqual(-0.4, result.y)
    }
}

