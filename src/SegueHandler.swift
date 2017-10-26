//
// HejkiSwiftCore
//
// Copyright (c) 2015-2016 Hejki
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

#if os(iOS)
    import UIKit
#else
    import Cocoa
#endif

/**
 Type safe segue handling. Start with define `SegueIdentifier`s in your `UIViewController` or `NSViewController`.
 
 ```swift
 class MyViewController: UIViewController, SegueHandler {
    enum SegueIdentifier: String {
        case ShowImportUnicorn = "ShowImportUnicorn"
        case ShowEditUnicorn = "ShowEditUnicorn"
    }
 }
 ```
 
 - Use function `performSegue(withIdentifier:sender:)` for performs the specific segue.
 - Use function `segueIdentifier(for:)` for obtain `SegueIdentifier` for prepareForSegue method or other view controller methods.
 */
public protocol SegueHandler {
    associatedtype SegueIdentifier: RawRepresentable
}

#if os(iOS)
public extension SegueHandler where Self: UIViewController, SegueIdentifier.RawValue == String {
    
    /**
     Performs the specified segue.
     
     - parameter identifier: defined segue identifier
     - parameter sender: The object that you want to use to initiate the segue. This parameter makes the object available to your implementation during the segue. Default value is nil
     */
    public func performSegue(withIdentifier identifier: SegueIdentifier, sender: Any? = nil) {
        performSegue(withIdentifier: identifier.rawValue, sender: sender)
    }
    
    /**
     Create segue identifier from storyboard segue instance.
     
     - parameter segue: storyboard segue
     */
    public func segueIdentifier(for segue: UIStoryboardSegue) throws -> SegueIdentifier {
        guard let identifier = segue.identifier,
            let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
                throw HSCAppError.invalidSegueIdentifier(identifier: segue.identifier)
        }
        
        return segueIdentifier
    }
}
//#else
//public extension SegueHandler where Self: NSSeguePerforming, SegueIdentifier.RawValue == String {
//
//    /**
//     Performs the specified segue.
//
//     - parameter identifier: defined segue identifier
//     - parameter sender: The object that you want to use to initiate the segue. This parameter makes the object available to your implementation during the segue. Default value is nil
//     */
//    @available(OSX 10.10, *)
//    public func performSegue(withIdentifier identifier: SegueIdentifier, sender: Any? = nil) {
//        performSegue?(withIdentifier: NSStoryboardSegue.Identifier(rawValue: identifier.rawValue), sender: sender)
//    }
//
//    @available(OSX 10.10, *)
//    public func segueIdentifier(for segue: NSStoryboardSegue) throws -> SegueIdentifier {
//        guard let identifier = segue.identifier,
//            let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
//                throw HSCAppError.invalidSegueIdentifier(identifier: segue.identifier.map { $0.rawValue })
//        }
//
//        return segueIdentifier
//    }
//}
#endif

