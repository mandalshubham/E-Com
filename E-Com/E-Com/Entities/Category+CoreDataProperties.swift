//
//  Category+CoreDataProperties.swift
//  E-Com
//
//  Created by Khushboo Verma on 6/3/19.
//  Copyright © 2019 Shubham Mandal. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int32

}
