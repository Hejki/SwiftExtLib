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

class MyViewController: UIViewController, SegueHandler {
    var performedId: String?
    
    enum SegueIdentifier: String {
        case Id = "id"
    }
    
    func handle() {
        performSegue(withIdentifier: .Id)
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
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
        let segue = UIStoryboardSegue(identifier: "id", source: controller, destination: controller)
        let id = try! controller.segueIdentifier(for: segue)
        XCTAssertEqual(MyViewController.SegueIdentifier.Id, id)
    }
}
