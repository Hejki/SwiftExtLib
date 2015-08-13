//
//  iOS_Tests.swift
//  iOS Tests
//
//  Created by Hejki on 13.08.15.
//
//

import Cocoa
import XCTest

@objc
@available(OSX 10.10, *)
class MyViewController: NSObject, NSSeguePerforming, SegueHandler {
    var performedId: String?
    
    enum SegueIdentifier: String {
        case Id = "id"
    }
    
    func handle() {
        performSegueWithIdentifier(.Id, sender: nil)
    }
    
    func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
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
        let id = controller.segueIdentifierForSegue(NSStoryboardSegue(identifier: "id", source: controller, destination: controller))
        XCTAssertEqual(MyViewController.SegueIdentifier.Id, id)
    }
}
