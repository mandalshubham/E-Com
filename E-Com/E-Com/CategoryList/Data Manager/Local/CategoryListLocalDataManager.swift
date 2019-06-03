//
//  CategoryListLocalDataManager.swift
//  E-Com
//
//  Created by Khushboo Verma on 6/3/19.
//  Copyright © 2019 Shubham Mandal. All rights reserved.
//

import CoreData

class CategoryListLocalDataManager: CategoryListLocalDataManagerInputProtocol {
        
    func retrieveCategoryList() throws -> [Category] {

        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<Category> = NSFetchRequest(entityName: String(describing: Category.self))
        
        return try managedOC.fetch(request)
    }
    
    func saveCategory(id: Int, name: String) throws {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newCategory = NSEntityDescription.entity(forEntityName: "Category",
                                                    in: managedOC) {
            let category = Category(entity: newCategory, insertInto: managedOC)
            category.id = Int32(id)
            category.name = name
            try managedOC.save()
        }
        throw PersistenceError.couldNotSaveObject
        
    }
    
}
