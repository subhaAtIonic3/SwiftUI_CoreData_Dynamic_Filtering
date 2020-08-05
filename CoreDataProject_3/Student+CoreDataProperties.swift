//
//  Student+CoreDataProperties.swift
//  CoreDataProject_3
//
//  Created by Subhrajyoti Chakraborty on 06/08/20.
//  Copyright © 2020 Subhrajyoti Chakraborty. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var section: String?
    
    var wrappedName: String {
        name ?? "Unknown"
    }
    
    var wrappedSection: String {
        section ?? "Unknown"
    }

}
