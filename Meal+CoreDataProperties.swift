//
//  Meal+CoreDataProperties.swift
//  FitnessTracker
//
//  Created by Victor Elujinmi on 5/8/20.
//  Copyright © 2020 V&M. All rights reserved.
//
//

import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var name: String?
    @NSManaged public var calorieCount: Int16
    @NSManaged public var prtCount: Int16
    @NSManaged public var imagePath: String?
    @NSManaged public var id: UUID?

}
