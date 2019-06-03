//
//  PersistenceError.swift
//  E-Com
//
//  Created by Khushboo Verma on 6/3/19.
//  Copyright © 2019 Shubham Mandal. All rights reserved.
//

import Foundation

enum PersistenceError: Error {
    case managedObjectContextNotFound
    case couldNotSaveObject
    case objectNotFound
}
