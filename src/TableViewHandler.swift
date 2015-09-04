//
//  TableViewHandler.swift
//  SwiftExtensionsLib
//
//  Created by Hejki on 20.08.15.
//
//

#if os(iOS)
    import UIKit
#else
    import AppKit
#endif

public protocol TableViewHandler {
    typealias CellIdentifier: RawRepresentable
}

#if os(iOS)
public extension TableViewHandler where Self: UITableViewDataSource, CellIdentifier.RawValue == String {

    func dequeueReusableCellWithIdentifier(cellIdentifier: CellIdentifier, tableView: UITableView, forIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(cellIdentifier.rawValue, forIndexPath: indexPath)
    }
}
#else
//public extension TableViewHandler where Self: NSTableViewDataSource, CellIdentifier.RawValue == String {
//    
//    func dequeueReusableCellWithIdentifier(cellIdentifier: CellIdentifier, tableView: NSTableView, forIndexPath indexPath: NSIndexPath) -> NSTableViewCell {
//        return tableView.dequeueReusableCellWithIdentifier(cellIdentifier.rawValue, forIndexPath: indexPath)
//    }
//}
#endif
