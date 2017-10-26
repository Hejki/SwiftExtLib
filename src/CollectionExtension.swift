//
//  CollectionExtension.swift
//  HejkiSwiftCore iOS
//
//  Created by Hejki on 26/07/2017.
//  source: https://www.natashatherobot.com/swift-3-0-refactoring-cues/

import UIKit

public protocol NibLoadableReusableView: class {}

extension NibLoadableReusableView where Self: UIView {
    
    static var identifier: String {
        return String(describing: self)
    }
}

public extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: NibLoadableReusableView {
        let nib = UINib(nibName: T.identifier, bundle: nil)
        
        register(nib, forCellReuseIdentifier: T.identifier)
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) where T: NibLoadableReusableView {
        let nib = UINib(nibName: T.identifier, bundle: nil)
        
        register(nib, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: NibLoadableReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifier)")
        }
        return cell
    }
    
    func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T where T: NibLoadableReusableView {
        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T else {
            fatalError("Could not dequeue header or footer with identifier: \(T.identifier)")
        }
        return cell
    }
}


public extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_: T.Type) where T: NibLoadableReusableView {
        let nib = UINib(nibName: T.identifier, bundle: nil)
        
        register(nib, forCellWithReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: NibLoadableReusableView {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifier)")
        }
        return cell
    }
}
