//
//  SegueHandler.swift
//  SwiftExtensionsLib
//
//  Created by Hejki on 13.08.15.
//
//

#if os(iOS)
    import UIKit
#else
    import AppKit
#endif

public protocol SegueHandler {
    typealias SegueIdentifier: RawRepresentable
}

#if os(iOS)
public extension SegueHandler where Self: UIViewController, SegueIdentifier.RawValue == String {
    
    func performSegueWithIdentifier(segueIdentifier: SegueIdentifier, sender: AnyObject?) {
        performSegueWithIdentifier(segueIdentifier.rawValue, sender: sender)
    }
    
    func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier,
            segueIdentifier = SegueIdentifier(rawValue: identifier) else {
                fatalError("Invalid segue identifier \(segue.identifier).")
        }
        
        return segueIdentifier
    }
}
#else
public extension SegueHandler where Self: NSSeguePerforming, SegueIdentifier.RawValue == String {
    
    @available(OSX 10.10, *)
    func performSegueWithIdentifier(identifier: SegueIdentifier, sender: AnyObject?) {
        performSegueWithIdentifier?(identifier.rawValue, sender: sender)
    }

    @available(OSX 10.10, *)
    func segueIdentifierForSegue(segue: NSStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier,
            segueIdentifier = SegueIdentifier(rawValue: identifier) else {
                fatalError("Invalid segue identifier \(segue.identifier).")
        }
        
        return segueIdentifier
    }
}
#endif

