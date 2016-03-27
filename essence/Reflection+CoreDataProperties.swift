//
//  Reflection+CoreDataProperties.swift
//  essence
//
//  Created by martin chibwe on 3/24/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Reflection {

    @NSManaged var body: String?
    @NSManaged var location: String?
    @NSManaged var imageData: NSData?
    @NSManaged var date: NSTimeInterval
   
    
    func sectionName() -> String {
//        let date = NSDate().dateByAddingTimeInterval(self.date)
        let date = NSDate(timeIntervalSinceReferenceDate: 123)
        let f = NSDateFormatter()
        f.dateFormat = "MMM yyyy"
        
        return f.stringFromDate(date)
    }

}
