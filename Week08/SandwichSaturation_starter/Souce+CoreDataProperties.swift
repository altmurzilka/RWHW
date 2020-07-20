//
//  Souce+CoreDataProperties.swift
//  SandwichSaturation
//
//  Created by Алтын on 7/21/20.
//  Copyright © 2020 Jeff Rames. All rights reserved.
//
//

import Foundation
import CoreData


extension Souce {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Souce> {
        return NSFetchRequest<Souce>(entityName: "Souce")
    }

    @NSManaged public var soucequantity: String?
    @NSManaged public var so2sand: NSSet?

}

// MARK: Generated accessors for so2sand
extension Souce {

    @objc(addSo2sandObject:)
    @NSManaged public func addToSo2sand(_ value: Sandwitch)

    @objc(removeSo2sandObject:)
    @NSManaged public func removeFromSo2sand(_ value: Sandwitch)

    @objc(addSo2sand:)
    @NSManaged public func addToSo2sand(_ values: NSSet)

    @objc(removeSo2sand:)
    @NSManaged public func removeFromSo2sand(_ values: NSSet)

}
