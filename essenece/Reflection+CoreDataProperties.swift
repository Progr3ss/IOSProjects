//
//  Reflection+CoreDataProperties.swift
//  essenece
//
//  Created by martin chibwe on 4/10/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Reflection {

    @NSManaged var body: String?
    @NSManaged var date: NSTimeInterval
    @NSManaged var imageData: NSData?
    @NSManaged var location: String?

}
