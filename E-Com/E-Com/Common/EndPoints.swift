//
//  EndPoints.swift
//  E-Com
//
//  Created by Shubham Mandal on 6/3/19.
//  Copyright © 2019 Shubham Mandal. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://stark-spire-93433.herokuapp.com"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Categories: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/json"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
