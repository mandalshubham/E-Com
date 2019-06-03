//
//  CategoryModel.swift
//  E-Com
//
//  Created by Shubham Mandal on 6/3/19.
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
    var products: [ProductModel] = []
    
}

struct ProductModel {
    var id = 0
    var name = ""
    var dateAdded = ""
    var taxName = ""
    var taxValue = 0.0
    var variants: [VariantModel] = []
}

struct VariantModel {
    var id = 0
    var color = ""
    var size = 0
    var price = 0
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
        products <- map["products"]
    }    
}

extension ProductModel: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id        <- map["id"]
        name      <- map["name"]
        dateAdded <- map["date_added"]
        taxName   <- map["tax.name"]
        taxValue  <- map["tax.value"]
        variants  <- map["variants"]
    }
}

extension VariantModel: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id       <- map["id"]
        color    <- map["color"]
        size     <- map["size"]
        price    <- map["price"]
    }
}

