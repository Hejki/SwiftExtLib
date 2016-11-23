//
//  iOS_Tests.swift
//  iOS Tests
//
//  Created by Hejki on 13.08.15.
//
//

import Cocoa
import XCTest
@testable import HejkiSwiftCore

@objc
@available(OSX 10.10, *)
class MyViewController: NSObject, NSSeguePerforming, SegueHandler {
    var performedId: String?
    
    enum SegueIdentifier: String {
        case Id = "id"
    }
    
    func handle() {
        performSegue(withIdentifier: .Id)
    }
    
    func performSegue(withIdentifier identifier: String, sender: Any?) {
        performedId = identifier
    }
}

@available(OSX 10.10, *)
class SegueHandlerTest: XCTestCase {
    var controller = MyViewController()
    
    func testPerformSegue() {
        controller.handle()
        XCTAssertEqual("id", controller.performedId)
    }
    
    func testSegueIdentifierForSegue() {
        let segue = NSStoryboardSegue(identifier: "id", source: controller, destination: controller)
        let id = try! controller.segueIdentifier(for: segue)
        XCTAssertEqual(MyViewController.SegueIdentifier.Id, id)
    }
    
    func testunknownIdentifier() {
        let segue = NSStoryboardSegue(identifier: "unknown", source: controller, destination: controller)
        do {
            _ = try controller.segueIdentifier(for: segue)
            XCTFail("must throw error.")
        } catch let e as HSCAppError {
            XCTAssertEqual("org.hejki.macos.hejki-swift-core", e.domain)
            XCTAssertEqual(0, e.code)
            XCTAssertNil(e.recoverySuggestion)
            XCTAssertEqual("Invalid segue identifier unknown", e.description)
        } catch {
            XCTFail("Bad error \(error)")
        }
    }
}
