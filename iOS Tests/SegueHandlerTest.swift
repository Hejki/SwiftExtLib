//
//  iOS_Tests.swift
//  iOS Tests
//
//  Created by Hejki on 13.08.15.
//
//

import UIKit
import XCTest

class MyViewController: UIViewController, SegueHandler {
    var performedId: String?
    
    enum SegueIdentifier: String {
        case Id = "id"
    }
    
    func handle() {
        performSegueWithIdentifier(.Id, sender: nil)
    }
    
    override func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
        performedId = identifier
    }
}

class SegueHandlerTest: XCTestCase {
    var controller = MyViewController()
    
    func testPerformSegue() {
        controller.handle()
        XCTAssertEqual("id", controller.performedId)
    }
    
    func testSegueIdentifierForSegue() {
        let id = controller.segueIdentifierForSegue(UIStoryboardSegue(identifier: "id", source: controller, destination: controller))
        XCTAssertEqual(MyViewController.SegueIdentifier.Id, id)
    }
}
