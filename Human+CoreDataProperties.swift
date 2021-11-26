//
//  Human+CoreDataProperties.swift
//  StorageApp
//
//  Created by Александр Арсенюк on 26.11.2021.
//
//

import Foundation
import CoreData


extension Human {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Human> {
        return NSFetchRequest<Human>(entityName: "Human")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var date: Date?

}

extension Human : Identifiable {

}
