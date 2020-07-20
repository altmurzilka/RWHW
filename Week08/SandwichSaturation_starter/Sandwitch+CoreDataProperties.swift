//
//  Sandwitch+CoreDataProperties.swift
//  SandwichSaturation
//
//  Created by Алтын on 7/21/20.
//  Copyright © 2020 Jeff Rames. All rights reserved.
//
//

import Foundation
import CoreData


extension Sandwitch {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sandwitch> {
        return NSFetchRequest<Sandwitch>(entityName: "Sandwitch")
    }

    @NSManaged public var name: String
    @NSManaged public var img: String
    @NSManaged public var sand2so: Souce

}
