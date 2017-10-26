//
//  NSManagedObjectExt.swift
//  SSH Config Editor
//
//  Created by Hejki on 07/09/2016.
//  Copyright © 2016 Hejki. All rights reserved.
//

import CoreData

public extension NSManagedObject {
    
    public static var entityName: String {
        return String(describing: self)
    }
    
}
