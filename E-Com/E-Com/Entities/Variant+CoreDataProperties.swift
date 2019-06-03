//
//  Variant+CoreDataProperties.swift
//  E-Com
//
//  Created by Shubham Mandal on 6/3/19.
//  Copyright © 2019 Shubham Mandal. All rights reserved.
//
//

import Foundation
import CoreData


extension Variant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Variant> {
        return NSFetchRequest<Variant>(entityName: "Variant")
    }

    @NSManaged public var id: Int32
    @NSManaged public var color: String?
    @NSManaged public var size: Int32
    @NSManaged public var price: Int32
    @NSManaged public var product: Product?

}
