//
//  CategoryModel.swift
//  E-Com
//
//  Created by Khushboo Verma on 6/3/19.
//  Copyright © 2019 Shubham Mandal. All rights reserved.
//

import Foundation

import Foundation
import ObjectMapper

struct CategoryResponse {
    var categories : [CategoryModel] = []
}

struct CategoryModel {
    var id = 0
    var name = ""
}

extension CategoryResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        categories       <- map["categories"]
    }
}

extension CategoryModel: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id       <- map["id"]
        name     <- map["name"]
    }    
}
